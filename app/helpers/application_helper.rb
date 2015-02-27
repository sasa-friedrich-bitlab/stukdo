module ApplicationHelper

  BOOTSTRAP_FLASH_MSG = {
    success: 'alert-success',
    error: 'alert-danger',
    alert: 'alert-warning',
    notice: 'alert-info'
  }
  BOOTSTRAP_FLASH_ICON = {
    success: 'glyphicon-ok',
    error: 'glyphicon-remove',
    alert: 'glyphicon-hand-up',
    notice: 'glyphicon-info-sign'
  }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG.fetch(flash_type.to_sym, flash_type.to_s)
  end

  def icon_class_for(flash_type)
    BOOTSTRAP_FLASH_ICON.fetch(flash_type.to_sym, flash_type.to_s)
  end

  def flash_messages(opts = {})
    html = ""
    flash.each do |msg_type, message|
      html << content_tag(:div, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do
                concat content_tag(:span, "", class: "glyphicon #{icon_class_for(msg_type)}")
                concat content_tag(:span, message, class: "message")
              end
    end
    html.html_safe
  end

end
