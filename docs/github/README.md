# GitHub

- [GitHub CLI](cli.md)
- [SSH](ssh.md)
    - [managing-github-ssh-key-cross-org-boundaries](managing-github-ssh-key-cross-org-boundaries.md)
- [copilot-voice](copilot-voice.md)

- [Find your GitHub user id](http://caius.github.io/github_id/#mbailey) (Mine is #4409 mbailey)

## Releases

- [Watch releases](https://github.blog/changelog/2018-11-27-watch-releases/)  You can limit repository notifications exclusively to releases.

Follow releases:  `https://github.com/(org or user)/(repo)/releases.atom`

## Issue and Pull Request templates
- [Announce (github.com)](https://github.blog/2016-02-17-issue-and-pull-request-templates/)
- [docs (github.com)](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests)

> ## Creating an issue from a task list item [(github.com)](https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue#creating-an-issue-from-a-task-list-item)
> 
> Within an issue, you can use task lists to break work into smaller tasks and
> track the full set of work to completion. If a task requires further tracking or
> discussion, you can convert the task to an issue by hovering over the task and
> clicking target in the upper-right corner of the task. For more information, see ["About
> task lists."](https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-issues/about-task-lists)
> 

## Github Organizations

Settings to stop repo visibility being set to public:

>[Default visibility for new repositories (github.blog)](https://github.blog/changelog/2020-07-10-default-visibility-for-new-repositories/)
> Now, when you're signed into GitHub through an organization's single sign on service and create a new repository through the website navigation, the default selection is Private.

> [Restricting repository visibility changes in your organization](https://docs.github.com/en/organizations/managing-organization-settings/restricting-repository-visibility-changes-in-your-organization)
> You can restrict the ability to change repository visibility to organization owners only, or you can allow anyone with admin access to a repository to change visibility.


## GitHub Actions

- [Using GitHub CLI in workflows - GitHub Docs](https://docs.github.com/en/actions/using-workflows/using-github-cli-in-workflows)
- [Events that trigger workflows - GitHub Docs](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows)
- [Using activity types and filters with multiple events](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#using-activity-types-and-filters-with-multiple-events)
- [Triggers  Dev Cheatsheets](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/ci-cd/github-actions/triggers.html)

### CLI

Watch Workflow run in realtime:

    gh run watch

- Workflow: runs one or more jobs
- Event:  triggers Action
- Job:
  - set of steps that execute on the same runner
  - shell script or Action
- Action: custom application
- Runner: server that runs your workflows
