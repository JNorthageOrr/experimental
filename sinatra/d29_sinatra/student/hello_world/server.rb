module HelloWorld

require 'time'

#Server class inherits from Sinatra Base class
class Server < Sinatra::Base
	get '/' do 
		erb :index
	end

	get '/about' do
		erb :about
	end

	get '/users/:user' do
		@user = params[:user]
		erb :index
	end



end



end


