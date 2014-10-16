class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :set_related_items

  def set_related_items
    related(Event.last)
  end
end
