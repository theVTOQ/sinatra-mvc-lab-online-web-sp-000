require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    @translation = ""
    erb :user_input
  end

  post '/piglatinize' do
    @translation = PigLatinizer.new.piglatinize(params[:user_phrase])
    erb :user_input
  end
end
