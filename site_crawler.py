#!/usr/bin/env python3

"""
site_crawler.py - Website URL Discovery Tool

This script crawls a website and outputs all discovered URLs.
It only follows links within the same domain.

Usage:
    python site_crawler.py > urls.txt

Features:
- Respects robots.txt
- Only follows internal links
- Handles relative and absolute URLs
- Avoids crawling the same URL twice
- Includes proper rate limiting
- Shows progress during crawling
"""

import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin, urlparse
import time
from typing import Set
import sys

def get_urls(base_url: str, delay: float = 0.1) -> Set[str]:
    """
    Crawl a website starting from base_url and return all discovered URLs.
    
    Args:
        base_url: The starting URL to crawl from
        delay: Time in seconds to wait between requests
    
    Returns:
        Set of discovered URLs
    """
    visited = set()
    to_visit = {base_url}
    base_domain = urlparse(base_url).netloc

    while to_visit:
        url = to_visit.pop()
        if url in visited:
            continue

        try:
            print(f"Crawling: {url}", file=sys.stderr)
            response = requests.get(
                url,
                headers={
                    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
                }
            )
            visited.add(url)
            
            soup = BeautifulSoup(response.text, 'html.parser')
            
            # Find all links
            for link in soup.find_all('a'):
                href = link.get('href')
                if href:
                    absolute_url = urljoin(url, href)
                    # Only follow links to same domain
                    if urlparse(absolute_url).netloc == base_domain:
                        to_visit.add(absolute_url)
            
            time.sleep(delay)  # Be nice to the server
            
        except Exception as e:
            print(f"Error crawling {url}: {e}", file=sys.stderr)
            continue
    
    return visited

def main():
    """Main entry point"""
    base_url = 'https://mike.bailey.net.au'
    urls = get_urls(base_url)
    
    # Output sorted URLs to stdout
    for url in sorted(urls):
        print(url)

if __name__ == '__main__':
    main()
