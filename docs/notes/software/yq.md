# yq

Like jq for YAML

- [GitHub.com/mikefarah/yq](https://github.com/mikefarah/yq)

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
