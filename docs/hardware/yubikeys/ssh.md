# Yubikeys SSH


- [SSH (developers.yubico.com)](https://developers.yubico.com/SSH/)
- [[drduh-YubiKeyGuide/README]]
- [drduh-text](drduh-text.md)

## YubiKey hardware-backed SSH authentication methods

- pgp
- piv
- fido2
- otp
- 
### PGP

The YubiKey stores and manages OpenPGP keys within its OpenPGP module. It will work with SSH clients that have integrated with the OpenPGP standard.

- [my notes](my-notes)

- [SSH authentication (developers.yubico.com)](https://developers.yubico.com/PGP/SSH_authentication/index.html)
- [drduh/YubiKey-Guide Guide to using YubiKey for GPG and SSH (github.com)](https://github.com/drduh/YubiKey-Guide)

### PIV

The YubiKey stores and manages RSA and Elliptic Curve (EC) asymmetric keys within its PIV module. It will work with SSH clients that can communicate with smart cards through the PKCS#11 interface.

### FIDO2

OpenSSH version 8.2p1 added support for FIDO hardware authenticators. FIDO devices are supported by the public key types “ecdsa-sk” and “ed25519-sk", along with corresponding certificate types.

### OTP

Systems administrators can configure two factor authentication for SSH authentication using the YubiKey through the [Yubico PAM module](https://developers.yubico.com/yubico-pam/).
