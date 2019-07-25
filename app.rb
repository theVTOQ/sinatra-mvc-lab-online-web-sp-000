require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    @translation = ""
    erb :user_input
  end

  post '/piglatinize' do
    @translation = PigLatinizer.new(params[:user_phrase]).translation
    erb :user_input
  end
end
