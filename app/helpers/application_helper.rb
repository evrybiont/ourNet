module ApplicationHelper
  def active term
    if params[:controller] == term
      'active'
    end
  end
end
