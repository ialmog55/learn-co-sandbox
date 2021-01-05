require 'sinatra'

class App < Sinatra::Base
    get '/' do
      "hello"
    end
  end