require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/robots' do
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  get '/robots/:id' do
    @robot = Robot.find_by(params[:id])
    erb :show
  end

  post '/robots' do
    robot = Robot.new(params[:robot])
    robot.save
    redirect '/robots'
  end




  not_found do
    erb :error
  end


end
