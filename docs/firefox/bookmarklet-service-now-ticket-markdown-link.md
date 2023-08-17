# Bookmarklet for ServiceNow Ticket Markdown Links

A bookmarklet to simplify extracting Markdown links from ServiceNow tickets.

## Bookmarklet Code:

```javascript
javascript:(function(){var taskNumber=document.title.split('|')[0].trim();var urlParams=new URLSearchParams(window.location.href.split('?')[2]);var sys_id=urlParams.get('sys_id');var baseUrl=window.location.origin;var shortUrl=baseUrl+'/nav_to.do?uri=sc_task.do?sys_id='+sys_id;if(window.location.href.includes('service-now.com')){prompt('Markdown Link:', '['+taskNumber+']('+shortUrl+')');}else{alert('Not a ServiceNow ticket');}})();
```

## Usage:

1. Create a new bookmark in your browser.
2. Copy and paste the above code into the bookmark's URL field.
3. Click it on a ServiceNow ticket page.
4. A prompt will display the Markdown link for the ticket, ready to copy.

## Details:

- Extracts the Task ID from the page title.
- Constructs a simplified URL similar to the "Copy URL" from the ServiceNow menu.

