# OData Query Options

These [OData (Open Data Protocol)](https://www.odata.org) query options can be used when consuming compatible APIs (such as graph.microsoft.com).

- [Querying Data (www.odata.org)](https://www.odata.org/getting-started/basic-tutorial/#queryData)
 
- **$filter**: only items where the expression evaluates to true are included in the response
    - `GET serviceRoot/People?$filter=FirstName eq 'Scott'`
- **$orderby**: request resources in either ascending order using `asc` or descending order using `desc`
    - `GET serviceRoot/People('scottketchum')/Trips?$orderby=EndsAt desc`
- **$top**: number of items to return
    - `GET serviceRoot/People?$top=2`
- **$skip**: number of items to skip
    - `GET serviceRoot/People?$skip=18`
- **$count**: request a count of items
    - `GET serviceRoot/People?$count=true`
- **$expand**: include related items. 
    - `GET serviceRoot/People('keithpinckney')?$expand=Friends`
- **$select**: requests a limited set of properties for each entity
    - `GET serviceRoot/Airports?$select=Name, IcaoCode`
- **$search**: restrict result to include only those entities matching the specified search expression
    - `serviceRoot/People?$search=Boise`
- **$lambda**: Values of `any` and `all` evaluate a Boolean expression on a collection
    - `GET serviceRoot/People?$filter=Emails/any(s:endswith(s, 'contoso.com'))`
