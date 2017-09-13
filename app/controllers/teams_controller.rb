class TeamsController < ApplicationController

  # get '/' do
  #   redirect '/teams'
  # end

  get '/teams' do
    @teams = Team.all
    @leagues = League.all
    erb :'teams/index'
  end

  get '/teams/new' do
    erb :"teams/new"
  end

  get '/teams/:id' do
    @teams = Team.find(params[:id])
    erb :"teams/show"
  end

  get '/teams/:id/edit' do
    @team = Team.find(params[:id])
    erb :"teams/edit"
  end

  post '/teams/:id' do
    @team = Team.find(params[:id])
    @team.name = params["team"]["name"]
    @team.mascot = params["team"]["mascot"]
    @team.colors = params["team"]["colors"]
    @team.save
    redirect to "/teams/#{@team.id}"
  end

  post "/teams" do
    Team.create(:name => params["team"]["name"], :mascot => params["team"]["mascot"], :colors => params["team"]["colors"])
    redirect '/teams'
  end

end
