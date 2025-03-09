# Service Now Bookmarklets


```
javascript:(function() {
    var incidentNumber = prompt('Enter Incident Number:', '');
    if (incidentNumber) {
        window.location.href = 'https://your-instance.service-now.com/incident_list.do?sysparm_query=number%3D' + incidentNumber;
    }
})();
```

<!-- markdown-link-check-disable -->
javascript:(function() {
    var query = prompt('Enter your query:', '');
    if (query) {
        window.location.href = 'https://your-instance.service-now.com/textsearch.do?sysparm_search=' + encodeURIComponent(query);
    }
})();
<!-- markdown-link-check-enable -->


