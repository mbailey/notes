# AWS-StartSSHSession

- [Document in AWS Console](https://ap-southeast-2.console.aws.amazon.com/systems-manager/documents/AWS-StartSSHSession)
## Content

```json
{
  "schemaVersion": "1.0",
  "description": "Document to open SSH connection over session manager to an instance",
  "sessionType": "Port",
  "parameters": {
    "portNumber": {
      "type": "String",
      "description": "(Optional) Port number of SSH server on the instance",
      "allowedPattern": "^([1-9]|[1-9][0-9]{1,3}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$",
      "default": "22"
    }
  },
  "properties": {
    "portNumber": "{{ portNumber }}"
  }
}
```