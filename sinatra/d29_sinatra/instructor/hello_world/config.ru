# requires the relevant classes we need
# we only Sinatra base for now
# our serverr class holds our server logic
require 'sinatra/base'
require_relative 'server'


# Namespacing Server inside HelloWorld Prevents naming collisions
# Booras::Jason
# Chan::Jason
run HelloWorld::Server
