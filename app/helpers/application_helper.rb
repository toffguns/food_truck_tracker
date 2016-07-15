module ApplicationHelper
  def alert_class_for(flash_type)
  {
    :success => 'alert-success',
    :error => 'alert-danger',
    :alert => 'alert-danger',
    :notice => 'alert-success'
  }[flash_type.to_sym] || flash_type.to_s
  end
end
