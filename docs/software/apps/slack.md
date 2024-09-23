# Slack


- [Slack CLI](https://api.slack.com/automation/quickstart)

## Questions

- [ ] Work out how to update slack staus with iOS Automations and Shortcuts

## Install


## Search

**`Ctrl-G`**: Search
**`Ctrl-F`**: Specific Conversation

**All your posts on a certain day**: `from:@me on:2024-01-08`

## Settings

- [markdown support (markdownguide.org)](https://www.markdownguide.org/tools/slack/)
- [emoji preferences (slack.com)](https://slack.com/intl/en-au/help/articles/4406393601683-Manage-emoji-preferences)

- Preferences
    - Input Options
        - [ ] When typing code with ```, Enter should not send the message
        - [x] Format messages with markup
    - When writing a message, press Enter to...
        - [x] Send the message
        - [ ] Start a new line

### Set your preference for one-click emoji reactions

One-click emoji reactions let you respond to messages in Slack almost instantly – simply hover over a message and choose from three emoji options. Owners and admins can choose default one-click reactions that you see, but you can customise them using the steps below.

    From your desktop, click on your profile picture in the top right.
    Select Preferences from the menu.
    Select Messages & media.
    Under Emoji, tick or untick the box next to Show one-click reactions on messages. If ticked, click the boxes to select three emoji.


## Stop Firefox prompting to open Slack App

To have Firefox directly open Slack links without prompting to open the Slack app, you can modify your Firefox settings. Here's how you can achieve this:

1. Open Firefox and type "about:config" in the address bar.

2. Accept the warning about proceeding with caution.

3. In the search bar at the top of the about:config page, type "protocol_handler".

4. Look for a preference named "network.protocol-handler.external.slack". If it doesn't exist, you can create it by right-clicking, selecting "New", and then "Boolean". Set its value to "false".

5. Also, check for "network.protocol-handler.warn-external.slack" and set it to "false" if it exists. If not, create it as a new Boolean preference.

These changes should prevent Firefox from prompting you to open the Slack app when you click on Slack links. Instead, it will open the links directly in Firefox.

If you still encounter issues, you might need to check your operating system's default app settings to ensure Slack links aren't automatically associated with the Slack application.

Remember, this change will affect all Slack links, so make sure this is the behavior you want for all cases. If you need to occasionally use the Slack app for certain links, you might want to consider keeping the prompt and just selecting your preferred action each time.