# Fuzzy File Finder

Pattern for quickly finding files that's included in many tools / editors.

## File naming suggestions

- Use proper names for things where reasonable (e.g. `enterprise-application`)
- Use long name ("Three Letter Acronym") as fzf will still detect the TLA
- Grouping things in dir removes need to include token in filename
    - avoid `azure-enterprise-app` if there are a bunch of things starting with `azure`
    - e.g. results for `azureapp` includes `azure/enterprise-application`
- Avoid creating unnecessarily deep directory stacks with few things in them