# Setting Touch Policy for OpenPGP Keys

- **Syntax**:

        ykman openpgp keys set-touch [KEY] [POLICY]

  - Replace `[KEY]` with the key slot (`sig`, `enc`, `aut`, or `att`).
  - Replace `[POLICY]` with the desired touch policy (`on`, `off`, `fixed`, `cached`, or `cached-fixed`).

- **Example**:
  To require a touch for the authentication key, use:
  ```bash
  ykman openpgp keys set-touch aut on
  ```
  This sets the touch policy to 'on' for the authentication key (`aut`).

- **Touch Policy Options**:
  - **`Cached`**: Touch is required, but it's cached for 15 seconds after use.
  - **`Cached-Fixed`**: Touch is required and cached for 15 seconds, and this setting can't be disabled without a full reset.
  - **`Fixed`**: Touch is required and can't be disabled without a full reset.
  - **`Off`**: No touch required (default setting).
  - **`On`**: Touch required for each operation.

### Notes

- The touch policy enhances the security of your YubiKey by ensuring that physical interaction is required for cryptographic operations, thereby preventing remote attacks.
- Be cautious when changing these settings, as the `fixed` options cannot be changed without resetting the OpenPGP application on the YubiKey.
- It's advisable to verify the current touch policy settings before making changes, to understand the existing configuration.

After setting the touch policy, you can verify it's working by attempting an operation that requires the key (like signing with GPG) and observing if the YubiKey requests a touch.