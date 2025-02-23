# Indirect variable expansion


${!varname} tells bash to:

1. Get the value of 'varname'
2. Use that value as the name of another variable to expand

Example:
```
prefix="OPENAI_PROXY"
var="${prefix}_PORT"
echo "${!var}"  # Prints the value of OPENAI_PROXY_PORT
```

This feature requires Bash 2.0 or later
It won't work in standard sh or other shells