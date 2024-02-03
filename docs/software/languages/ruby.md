# Ruby

## [rbenv](https://github.com/rbenv/rbenv) and [ruby-build](https://github.com/rbenv/ruby-build#readme)

Install deps (fedora-36):

    sudo dnf -y groupinstall "Development Tools"

    sudo dnf -y install \
      autoconf          \
      automake          \
      bison             \
      bzip2             \
      curl              \
      gcc-c++           \
      git-core          \
      libffi-devel      \
      libtool           \
      libyaml-devel     \
      make              \
      openssl-devel     \
      patch             \
      readline          \
      readline-devel    \
      sqlite-devel      \
      zlib              \
      zlib-devel

Install deps (debian / ubuntu):

    apt-get install    \
      autoconf         \
      bison            \
      build-essential  \
      libssl-dev       \
      libyaml-dev      \
      libreadline6-dev \
      zlib1g-dev       \
      libncurses5-dev  \
      libffi-dev       \
      libgdbm6         \
      libgdbm-dev      \
      libdb-dev

Install rbenv:

    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    echo 'export PATH="$PATH:$HOME/.rbenv/bin"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    exec $SHELL

Install ruby-build:

    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo 'export PATH="$PATH:$HOME/.rbenv/plugins/ruby-build/bin"' >> ~/.bashrc
    exec $SHELL

List ruby versions available to install:

    $ rbenv install  --list
    2.6.10
    2.7.6
    3.0.4
    3.1.2
    jruby-9.3.6.0
    mruby-3.1.0
    picoruby-3.0.0
    rbx-5.0
    truffleruby-22.2.0
    truffleruby+graalvm-22.2.0

Install a ruby version:

    $ rbenv install 3.1.2
    Downloading ruby-3.1.2.tar.gz...
    -> https://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.2.tar.gz
    Installing ruby-3.1.2...
    Installed ruby-3.1.2 to /home/m/.rbenv/versions/3.1.2

Set a ruby version to be used globally:

    $ rbenv global 3.1.2
    $ ruby -v
    ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]


<!--
## ruby-on-rails 

- [bash-completion](https://raw.githubusercontent.com/mernen/completion-ruby/main/completion-rails)
- https://guides.rubyonrails.org/api_app.html
- https://medium.com/alturasoluciones/how-to-set-up-rails-api-app-to-use-activeadmin-79b418df8aad


    gem install rails

    rails new playlists

    rails generate scaffold playlist  \
      program                         \
      episode                         \
      playlist                        \
      artist                          \
      title                           \
      position                        \
      track                           \

    [activeadmin](https://activeadmin.info/documentation.html)

    # Gemfile
    gem 'activeadmin'
    gem 'devise'
    gem 'country_select', '~> 6.0'
    gem 'sassc'

    # api
    mkdir -p app/assets/config && echo '{}' > app/assets/config/manifest.js
    # config/application.rb
    require "sprockets/railtie"
    config.middleware.use Rack::MethodOverride
    config.middleware.use ActionDispatch::Flash
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    $ cat api_controller.rb
    class ApiController < ActionController::API
    end
    $ cat application_controller.rb
    class ApplicationController < ActionController::Base
    end

    bin/rails generate active_admin:install
    bin/rails db:migrate db:seed

    rails generate active_admin:resource Playlist


    - [rails API](https://guides.rubyonrails.org/api_app.html)

## Play with it

    # ./db/seeds.rb
    Device.create(name: 'au01')
    Device.create(name: 'au02')
    Device.create(name: 'nz01')

    curl -X POST -H "Content-Type:application/json" \
      -d '{ "name": "foobar" }' http://localhost:3000/devices

    curl -XDELETE http://localhost:3000/devices/1

-->
