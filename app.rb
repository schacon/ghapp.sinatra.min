require 'sinatra'
require 'sinatra_auth_github'

class MinApp < Sinatra::Base
  enable :sessions

  # You should probably leave the ENV settings as they are and set them in your
  # environment.  If deploying to Heroku, for example, you would [run these][hr] 
  # commands once:
  #
  #   $ heroku config:add GITHUB_CLIENT_SECRET=....
  #   $ heroku config:add GITHUB_CLIENT_ID=....
  #
  # Now when you deploy the app, Heroku will give you the correct values for this
  #
  # You will probably also want to choose the correct scope for what you want
  # to do.  See the GitHub [OAuth2 docs][oa] and go to the Scopes section to 
  # see what is available.
  #
  # [hr]: http://devcenter.heroku.com/articles/config-vars
  # [oa]: http://developer.github.com/v3/oauth/
  #
  set :github_options, {
    :scopes    => 'user'
  }

  register Sinatra::Auth::Github

  # initial landing page - if the user is already authenticated, we simply
  # redirect them to the main application method, otherwise we show them
  # some sort of login screen
  get '/' do
    if authenticated?
      redirect '/app'
    else
      erb :index
    end
  end

  # main application method - you have a logged in user.  if not, we redirect
  # them back to the landing page
  get '/app' do
    if github_user
      @user = github_user
      erb :app
    else
      redirect '/'
    end
  end

  get '/auth' do
    authenticate!
    redirect '/app'
  end

  get '/logout' do
    logout!
    redirect '/'
  end
end
