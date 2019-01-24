require 'sinatra/base' #theres a base file in the sinatra package called base, we require that
require_relative 'server'


#run command is rack command that runs whatever comes after it
#App/HelloWord is a namespace / module, look for 'Server' under the 'App' module

run HelloWorld::Server


