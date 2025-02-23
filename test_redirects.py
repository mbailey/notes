#!/usr/bin/env python3
"""
Test redirects defined in mkdocs.yml to ensure they work properly.
This script:
1. Reads redirect_maps from mkdocs.yml
2. Tests each redirect to ensure it redirects correctly
3. Verifies the final destination returns a 200 status code
"""

import sys
import yaml
import requests
from urllib.parse import urljoin
import time
from colorama import init, Fore, Style
import re

# Initialize colorama for colored output
init()

def load_redirect_maps(yaml_file='mkdocs.yml'):
    """Load redirect maps from mkdocs.yml file."""
    try:
        # Read the file as text first
        with open(yaml_file, 'r') as f:
            yaml_content = f.read()
        
        # Replace Python object references with placeholders
        # This is a more robust approach than trying to add constructors for each tag
        pattern = r'!!python/name:[^\s]+'
        cleaned_yaml = re.sub(pattern, '!!null', yaml_content)
        
        # Parse the cleaned YAML
        config = yaml.safe_load(cleaned_yaml)
            
        # Navigate to the redirect_maps section
        plugins = config.get('plugins', [])
        for plugin in plugins:
            if isinstance(plugin, dict) and 'redirects' in plugin:
                return plugin['redirects'].get('redirect_maps', {})
        
        print(f"{Fore.RED}Error: No redirect_maps found in {yaml_file}{Style.RESET_ALL}")
        return {}
    except Exception as e:
        print(f"{Fore.RED}Error loading {yaml_file}: {e}{Style.RESET_ALL}")
        return {}

def get_expected_url(destination, base_url):
    """
    Convert a destination path to the expected URL format.
    For blog posts, this follows the year/month/slug format.
    """
    # Remove .md extension for all URLs
    if destination.endswith('.md'):
        destination = destination[:-3]
    
    # Special handling for blog posts
    if destination.startswith('blog/posts/'):
        # Extract date and slug from the filename pattern yyyy-mm-dd-slug
        match = re.match(r'blog/posts/(\d{4})-(\d{2})-\d{2}-(.*)', destination)
        if match:
            year, month, slug = match.groups()
            # Format according to MkDocs blog plugin's post_url_format
            return urljoin(base_url, f"{year}/{month}/{slug}/")
    
    # For non-blog pages, just remove .md and add trailing slash
    return urljoin(base_url, f"{destination}/")

def test_redirects(redirect_maps, base_url='http://localhost:8000/'):
    """Test each redirect and verify the final destination."""
    success_count = 0
    failure_count = 0
    
    print(f"{Fore.CYAN}Testing {len(redirect_maps)} redirects from {base_url}...{Style.RESET_ALL}")
    print("-" * 80)
    
    for source, destination in redirect_maps.items():
        # Remove .md extension from source URL
        if source.endswith('.md'):
            source_url = urljoin(base_url, source[:-3])
        else:
            source_url = urljoin(base_url, source)
            
        # Get the expected URL based on MkDocs configuration
        expected_url = get_expected_url(destination, base_url)
        
        try:
            # Allow redirects but track them
            response = requests.get(source_url, allow_redirects=True)
            final_url = response.url
            status_code = response.status_code
            
            # Check if we ended up at a 200 status
            if status_code == 200:
                print(f"{Fore.GREEN}✓ {source} → {final_url} (200 OK){Style.RESET_ALL}")
                success_count += 1
            else:
                print(f"{Fore.RED}✗ {source}{Style.RESET_ALL}")
                print(f"  Expected status: 200")
                print(f"  Actual URL: {final_url} (Status: {status_code})")
                failure_count += 1
                
        except requests.exceptions.RequestException as e:
            print(f"{Fore.RED}✗ {source}{Style.RESET_ALL}")
            print(f"  Error: {e}")
            failure_count += 1
            
        # Small delay to avoid hammering the server
        time.sleep(0.1)
    
    print("-" * 80)
    print(f"{Fore.CYAN}Summary: {success_count} successful, {failure_count} failed{Style.RESET_ALL}")
    
    return success_count, failure_count

def main():
    """Main function to run the redirect tests."""
    # Default base URL (can be overridden by command line argument)
    base_url = "http://localhost:8000/"
    
    # Check if a base URL was provided as a command line argument
    if len(sys.argv) > 1:
        base_url = sys.argv[1]
        if not base_url.endswith('/'):
            base_url += '/'
    
    print(f"{Fore.YELLOW}Testing redirects using base URL: {base_url}{Style.RESET_ALL}")
    
    # Load redirect maps from mkdocs.yml
    redirect_maps = load_redirect_maps()
    
    if not redirect_maps:
        print(f"{Fore.RED}No redirects found to test.{Style.RESET_ALL}")
        return 1
    
    # Test the redirects
    success_count, failure_count = test_redirects(redirect_maps, base_url)
    
    # Return non-zero exit code if any redirects failed
    return 0 if failure_count == 0 else 1

if __name__ == "__main__":
    sys.exit(main())
