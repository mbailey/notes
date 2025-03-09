# Bookmarklet for ServiceNow Ticket Markdown Links

A bookmarklet to simplify extracting Markdown links from ServiceNow tickets.

- Extracts the Task ID from the page title.
- Constructs a simplified URL similar to the "Copy URL" from the ServiceNow menu.

**A hyperlink takes one mouseclick to view compared to:**

1. **Copying Ticket ID to clipboard:** 2 clicks, Ctrl+C
2. **Switching to web browser:** Alt+TAB (TAB TAB TAB where is it)
3. **Opening Service Now from folder in browser bookmark bar:** 2 clicks
4. **Selecting search field:** 1 click
5. **Pasting Ticket ID from clipboard**: CTRL-V + Enter
## Bookmarklet Code:

```javascript
javascript: (function () {
  var taskNumber = document.title.split("|")[0].trim();
  var decodedUrl = decodeURIComponent(window.location.href);
  var sys_id_match = decodedUrl.match(/sys_id=([a-f0-9]+)/);
  var sys_id = sys_id_match ? sys_id_match[1] : "";
  var baseUrl = window.location.origin;
  var type;
  if (decodedUrl.includes("/sc_task.do")) {
    type = "sc_task.do";
  } else if (decodedUrl.includes("/incident.do")) {
    type = "incident.do";
  } else if (decodedUrl.includes("/change_request.do")) {
    type = "change_request.do";
  } else if (decodedUrl.includes("/sc_req_item.do")) {
    type = "sc_req_item.do";  // Support for requested item
  } else {
    alert("Unrecognized type");
    return;
  }
  var shortUrl = baseUrl + "/nav_to.do?uri=" + type + "?sys_id=" + sys_id;
  if (decodedUrl.includes("service-now.com")) {
    prompt("Markdown Link:", "[" + taskNumber + "](" + shortUrl + ")");
  } else {
    alert("Not a ServiceNow ticket");
  }
})();
```

## Usage:

1. Create a link in your browser's bookmarks bar.
2. Enter the contents above.
3. Click it on a ServiceNow ticket page.
4. A prompt will display the Markdown link for the ticket, ready to copy.

