class EventsController < ApplicationController
  inherit_resources

  def index
    $redis.set 'hello', 'hello world', ex: 10*60
    @hello = $redis.get 'hello'
  end
end
