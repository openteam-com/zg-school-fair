require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/base'

require './models/event'

Tilt.register Tilt::ERBTemplate, 'html.erb'

get '/' do
  @events = Event.all
  @events.map(&:title)
end

#manage
#index
get '/manage/events' do
  @events = Event.all
  erb :"manage/index"
end

#new
get '/manage/event/new' do
  erb :"manage/new"
end

#create
post '/manage/event/new' do
  Event.create(params[:event])
end
