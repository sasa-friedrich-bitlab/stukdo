module ApplicationHelper

  BOOTSTRAP_FLASH_MSG = {
    success: 'alert-success',
    error: 'alert-danger',
    alert: 'alert-warning',
    notice: 'alert-info'
  }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG.fetch(flash_type.to_sym, flash_type.to_s)
  end

  def flash_messages(opts = {})
    html = ""
    flash.each do |msg_type, message|
      html << content_tag(:div, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible fade in", role: "alert") do
                concat content_tag(:button, '<i class="fa fa-remove"></i>'.html_safe, class: "close", data: { dismiss: 'alert' }, aria: { label: 'Close' } )
                concat message
              end
    end
    html.html_safe
  end

end
