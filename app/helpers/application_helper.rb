module ApplicationHelper
  def toggle_active(path)
    request.path == path ? 'active' : ''
  end
end
