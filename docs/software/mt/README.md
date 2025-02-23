---
alias: mt
---
# mt

Reduce the effort to turn an idea into reality - and be able to find it again later!

mt is a personal organiser for code and config. 

- https://github.com/mbailey/mt

## dotfiles

- XDG_config_home: symlink in for apps without support
- Don't stow non dotfiles:
    - .stowignore requires dot-config
    - wrapper script specifies dot-config

## Merge mt-public with notes

- Disable graph
- Exclude non notes (bin / config)



## Chatgpt 01 discussion

2025-01-08 21:11:38 +11:00 Wed

Yes, you can absolutely include external YAML files in your mkdocs.yml configuration to manage things like navigation. This is particularly useful if you want to separate your navigation configuration into its own file and regenerate it dynamically as part of your build process.

  

How to Include External Files in mkdocs.yml

  

MkDocs supports YAML anchors and aliases, but for full external file inclusion, you can use the [!include](https://www.mkdocs.org/user-guide/configuration/#extension-options) syntax provided by plugins like [mkdocs-include-yaml](https://github.com/sphinx-contrib/mkdocs-include-yaml).

  

Steps to Include Navigation from an External File

1. Install the Plugin:

First, install the mkdocs-include-yaml plugin:

  

pip install mkdocs-include-yaml

  

  

2. Update mkdocs.yml:

Use the !include syntax to include an external file for the navigation section:

  

site_name: My Documentation

theme:

  name: material

  

nav: !include nav.yml

  

plugins:

  - include-yaml

  

  

3. Create the nav.yml File:

Place your dynamically generated navigation structure in a nav.yml file:

  

- Editors:

    - Neovim:

        - Overview: editors/neovim/readme.md

        - Installation Guide: editors/neovim/docs/install.md

        - Usage: editors/neovim/docs/usage.md

- Tools:

    - TMUX:

        - Overview: tools/tmux/readme.md

        - Configurations: tools/tmux/docs/config.md

  

  

4. Regenerate nav.yml During Build:

Write a script to regenerate nav.yml dynamically based on your repository structure. For example:

  

#!/usr/bin/env bash

#

# generate-nav - Regenerate nav.yml for MkDocs navigation

#

# Usage: ./generate-nav

  

set -eu -o pipefail

  

generate-nav() {

    echo "- Editors:" > nav.yml

    for dir in mt-public/editors/*; do

        pkg=$(basename "$dir")

        echo "  - ${pkg^}:" >> nav.yml

        echo "      - Overview: $dir/readme.md" >> nav.yml

        if [[ -d "$dir/docs" ]]; then

            for file in "$dir/docs"/*.md; do

                filename=$(basename "$file" .md)

                echo "      - ${filename^}: $file" >> nav.yml

            done

        fi

    done

}

  

generate-nav

  

  

5. Integrate the Script into Your Build:

Add this script to your build process (e.g., Makefile, CI pipeline):

  

./generate-nav && mkdocs build

  

Benefits of This Approach

• Separation of Concerns: Keeps the main mkdocs.yml clean and focused on general configuration.

• Dynamic Updates: Automates the navigation generation, reducing manual errors.

• Scalability: Works well for large repositories with many packages.

  

Would you like a refined version of the script or help integrating this into your workflow?



# again

Yes, you can absolutely include external YAML files in your mkdocs.yml configuration to manage things like navigation. This is particularly useful if you want to separate your navigation configuration into its own file and regenerate it dynamically as part of your build process.

  

How to Include External Files in mkdocs.yml

  

MkDocs supports YAML anchors and aliases, but for full external file inclusion, you can use the [!include](https://www.mkdocs.org/user-guide/configuration/#extension-options) syntax provided by plugins like [mkdocs-include-yaml](https://github.com/sphinx-contrib/mkdocs-include-yaml).

  

Steps to Include Navigation from an External File

1. Install the Plugin:

First, install the mkdocs-include-yaml plugin:

  

pip install mkdocs-include-yaml

  

  

2. Update mkdocs.yml:

Use the !include syntax to include an external file for the navigation section:

  

site_name: My Documentation

theme:

  name: material

  

nav: !include nav.yml

  

plugins:

  - include-yaml

  

  

3. Create the nav.yml File:

Place your dynamically generated navigation structure in a nav.yml file:

  

- Editors:

    - Neovim:

        - Overview: editors/neovim/readme.md

        - Installation Guide: editors/neovim/docs/install.md

        - Usage: editors/neovim/docs/usage.md

- Tools:

    - TMUX:

        - Overview: tools/tmux/readme.md

        - Configurations: tools/tmux/docs/config.md

  

  

4. Regenerate nav.yml During Build:

Write a script to regenerate nav.yml dynamically based on your repository structure. For example:

  

#!/usr/bin/env bash

#

# generate-nav - Regenerate nav.yml for MkDocs navigation

#

# Usage: ./generate-nav

  

set -eu -o pipefail

  

generate-nav() {

    echo "- Editors:" > nav.yml

    for dir in mt-public/editors/*; do

        pkg=$(basename "$dir")

        echo "  - ${pkg^}:" >> nav.yml

        echo "      - Overview: $dir/readme.md" >> nav.yml

        if [[ -d "$dir/docs" ]]; then

            for file in "$dir/docs"/*.md; do

                filename=$(basename "$file" .md)

                echo "      - ${filename^}: $file" >> nav.yml

            done

        fi

    done

}

  

generate-nav

  

  

5. Integrate the Script into Your Build:

Add this script to your build process (e.g., Makefile, CI pipeline):

  

./generate-nav && mkdocs build

  

Benefits of This Approach

• Separation of Concerns: Keeps the main mkdocs.yml clean and focused on general configuration.

• Dynamic Updates: Automates the navigation generation, reducing manual errors.

• Scalability: Works well for large repositories with many packages.

  

Would you like a refined version of the script or help integrating this into your workflow?

