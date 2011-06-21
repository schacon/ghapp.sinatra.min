Minimal Sinatra GitHub Application
==================================

This is the smallest working Sinatra application that authenticates via the GitHub [OAuth2][oa] stuff. This skeleton app exists simply because it took me a little while to figure out how to put all the pieces together to get to the point that I could start building something.  So here you go.

[oa]: http://developer.github.com/v3/oauth/

Basically, to get this app running on Heroku, for instance, you will want to:

* Register a new Heroku instance (you will have to use something other than 'ghmin')

        $ heroku apps:create ghmin
        Creating ghmin... done, stack is bamboo-mri-1.9.2
        http://ghmin.heroku.com/ | git@heroku.com:ghmin.git
        Git remote heroku added

* Add SSL to your Heroku instance, since we are dealing with user tokens here

        $ heroku addons:add piggyback_ssl
        Adding piggyback_ssl to ghmin... done (free)

* Register your GitHub OAuth2 application with that new URL (but https) at:

        https://github.com/account/applications/new

* Set your Client Secret and Client ID as environment values in your Heroku instance

        $ heroku config:add GITHUB_CLIENT_SECRET=....
        $ heroku config:add GITHUB_CLIENT_ID=....

* Push to Heroku

        $ git push heroku master
        Counting objects: 21, done.
        Delta compression using up to 2 threads.
        Compressing objects: 100% (19/19), done.
        Writing objects: 100% (21/21), 3.92 KiB, done.
        Total 21 (delta 3), reused 0 (delta 0)

        -----> Heroku receiving push
        -----> Sinatra app detected
        -----> Gemfile detected, running Bundler version 1.0.7
               Unresolved dependencies detected; Installing...
               Using --without development:test

               Fetching source index for http://rubygems.org/
               Installing addressable (2.2.6) 
               Installing multipart-post (1.1.2) 
               Installing rack (1.3.0) 
               Installing faraday (0.6.1) 
               Installing json (1.5.3) with native extensions 
               Installing mime-types (1.16) 
               Installing multi_json (1.0.3) 
               Installing oauth2 (0.4.1) 
               Installing rest-client (1.6.3) 
               Installing tilt (1.3.2) 
               Installing sinatra (1.2.6) 
               Installing warden (1.0.4) 
               Installing warden-github (0.0.9) 
               Installing sinatra_auth_github (0.0.16) 
               Using bundler (1.0.7) 
               Your bundle is complete! It was installed into ./.bundle/gems/
        -----> Compiled slug size is 1.4MB
        -----> Launching... done, v8
               http://ghmin.heroku.com deployed to Heroku

        To git@heroku.com:ghmin.git
         * [new branch]      master -> master

Boom.

That should be it, you should now have a running application that allows users to authenticate via GitHub so you can now use the extensive API to do whatever you wish.

Next you will probably want to read through the `app.rb` file and start modifying stuff.  Good luck!




