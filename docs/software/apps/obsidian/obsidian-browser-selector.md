# Obsidian Browser Selector

**Untested**

It is possible to configure your system to open specific links in different browsers or profiles. However, Obsidian does not natively support this feature, so you will need to use an intermediary script or an external tool. Here's a simplified way of achieving this using a script:

1. **Create a Script**: 
   - Create a script ([browser-selector](../../../../../personal/bin/browser-selector)) to decide which browser to use based on the URL.
   - The script can look at the URL and decide which browser (or browser profile) to open it with.

2. **Make the Script Executable**:
   - Run `chmod +x browser-selector.sh` to make the script executable.

3. **Configure Obsidian**:
   - In Obsidian, go to `Settings` -> `System` -> `Default app for opening links` and choose `Custom`.
   - Enter the path to your `browser-selector.sh` script.

Now, when you click a link in Obsidian, the `browser-selector.sh` script will be invoked with the URL, and the script will decide which browser to open based on the URL.

Ensure the paths to the browsers are correct and adjust the conditions in the script to match your preferences.
