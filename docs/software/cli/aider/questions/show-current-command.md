# How can I see the aider command line equivalent of my current aider instance?

To see the command line arguments that would recreate your current aider session:

1. Type `/run code .` in the aider chat
2. This will display the current configuration, including all active command line options

For example, you might see output like:
```bash
aider --architect --yes-always --auto-test --test-cmd 'cargo check'
```

This is particularly useful when you want to:
- Save a working configuration for later use
- Share your exact aider setup with others
- Document your preferred settings
