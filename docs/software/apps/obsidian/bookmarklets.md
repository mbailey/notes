# Obsidian Bookmarklets

Bookmarks for your browser toolbar that do neat things.

See also: [bookmarklets](../browsers/bookmarklets.md)

## Open in Obsidian (WIP)

Click this bookmarklet while browsing a page from your vault on the web (e.g. GitHub.com) to open it in Obsidian.

**Note**: It requires that you configure mappings between URLs and your paths in your Obsidian Vault.

<a href="javascript:(function(){let obsidianBasePath='obsidian://open?vault=notes&file=';let pathMappings=[{urlPath:'https://github.com/bash-my-aws/bash-my-aws/blob/master',obsidianPath:'bash-my-aws'},];let currentUrl=window.location.href;console.log('Original URL:',currentUrl);let modifiedPath=currentUrl;pathMappings.forEach(mapping=>{if(typeof mapping.urlPath==='string'){modifiedPath=modifiedPath.replace(new RegExp(mapping.urlPath,'i'),mapping.obsidianPath);}else{modifiedPath=modifiedPath.replace(mapping.urlPath,mapping.obsidianPath);} console.log('After mapping:',modifiedPath);});let obsidianUrl=obsidianBasePath+encodeURIComponent(modifiedPath);console.log('Final Obsidian URL:',obsidianUrl);window.open(obsidianUrl);})();">Open in Obsidian</a>


```javascript
javascript:(function() {
    let obsidianBasePath = 'obsidian://open?vault=notes&file=';
    let pathMappings = [
        {urlPath: 'https://github.com/bash-my-aws/bash-my-aws/blob/master', obsidianPath: 'bash-my-aws'},
        // Add more path mapping objects as needed
    ];

    let currentUrl = window.location.href;
    console.log('Original URL:', currentUrl);  // Debugging: Log the original URL

    let modifiedPath = currentUrl;
    pathMappings.forEach(mapping => {
        if (typeof mapping.urlPath === 'string') {
            modifiedPath = modifiedPath.replace(new RegExp(mapping.urlPath, 'i'), mapping.obsidianPath);
        } else {
            modifiedPath = modifiedPath.replace(mapping.urlPath, mapping.obsidianPath);
        }
        console.log('After mapping:', modifiedPath);  // Debugging: Log the URL after each mapping
    });

    let obsidianUrl = obsidianBasePath + encodeURIComponent(modifiedPath);
    console.log('Final Obsidian URL:', obsidianUrl);  // Debugging: Log the final Obsidian URL

    // Optionally, open the URL (comment out for debugging only)
    window.open(obsidianUrl);
})();