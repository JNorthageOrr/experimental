module HelloWorld

# require 'pry'
require 'time' # needed for the Time methods

class Server < Sinatra::Base

  # handles GET requests to our server
  get '/' do
    # logic pertaining to our views
    erb :index
  end

  get '/about' do
    erb :about
  end

  get '/:user' do
    # binding.pry/
    @user = params[:user]
    erb :index
  end

  get '/:user/tweets' do
    @user = params[:user]
    @tweets = ["sample data",
                "akjfhakjshfkjsahfkashfa",
                " <3 Han Solo"
              ]
    erb(:tweets) # render me a html string using the erb renderer
  end

  get '/:x/add/:y' do
    (params[:x].to_i + params["y"].to_i).to_s
  end


end






end
