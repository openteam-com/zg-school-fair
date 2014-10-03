require 'sinatra'
require 'sinatra/activerecord'
require 'active_record'
require './models/event'

Tilt.register Tilt::ERBTemplate, 'html.erb'

get '/' do
  @events = Event.all
  @events.map(&:title)
end

get '/manage/event/new' do
  @event = "hey ho!!"
  erb :"manage/new"
end

post '/manage/event/new' do
  Event.create(params[:event])
end



