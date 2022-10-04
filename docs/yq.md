# yq

Like jq for YAML

    $ cat foo.json
    {
      "Bill": {"age": 19},
      "Ben": {"age": 20}
    }
    $ yq -P foo.json
    Bill:
      age: 19
    Ben:
      age: 20
