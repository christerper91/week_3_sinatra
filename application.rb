require 'sinatra'

class RockPaperScisor < Sinatra::Base
enable :session
  get '/' do
    erb :homepage
  end
  post '/' do
    session['player_name'] = params[:player_name]
    @player_name = session['player_name']
    erb :menu
    end

  get '/menu' do
    erb :menu
  end

  get '/game' do
    erb :game
  end
end

#   get 'game/throw' do
#     session['count'] = 0
#     options = ['rock', 'paper', 'scisor']
#     computer_choice = rand(options.length)
#     player_choice = params [:player_choice]
#     computer_answer = options [computer_choice]
#     session['count'] += 1
#     @count = session['count']
#
#     if player_choice == 'rock' && computer_answer == 'paper'
#       #player lose
#     elsif player_choice == 'paper' && computer_answer == 'scisor'
#       #player lose
#     elsif player_choice == 'scisor' && computer_answer == 'rock'
#   end
# end
