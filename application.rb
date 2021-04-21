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

  get '/game/throw/:player_choice' do
    session['count'] = 0
    options = ['rock', 'paper', 'scisor']
    computer_choice = rand(options.length)
    player_choice = params[:player_choice]


    computer_answer = options[computer_choice]
    session['count'] += 1

    @count = session['count']

    if player_choice == 'rock' && computer_answer == 'scisor'
      #player win
      @result = 'You win!'
    elsif player_choice == 'paper' && computer_answer == 'rock'
      #player win
      @result = 'You win!'
    elsif player_choice == 'scisor' && computer_answer == 'paper'
      #player win
      @result = 'You win!'
    elsif computer_answer == 'rock' && player_choice == 'scisor'
     #computer win
     @result = 'You lose!'
    elsif computer_answer == 'paper' && player_choice == 'rock'
     #computer win
     @result = 'You lose!'
    elsif computer_answer == 'scisor' && player_choice == 'paper'
     #computer win
     @result = 'You lose!'
    else
     @result = 'Tied!'
   end
  end
end
