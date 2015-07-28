module Manage::ManageHelper
  def event_for_nav
    Event.find('school-fair-about')
  end
end
