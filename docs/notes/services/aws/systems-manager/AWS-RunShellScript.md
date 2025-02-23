# AWS-RunShellScript

Run a script or command.


| Name             | Type       | Description                                                                                                                                              | Default Value |
| ---------------- | ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------- |
| commands         | StringList | (Required) Specify a shell script or a command to run.                                                                                                   | -             |
| workingDirectory | String     | (Optional) The path to the working directory on your instance.                                                                                           | -             |
| executionTimeout | String     | (Optional) The time in seconds for a command to complete before it is considered to have failed. Default is 3600 (1 hour). Maximum is 172800 (48 hours). | 3600          |
