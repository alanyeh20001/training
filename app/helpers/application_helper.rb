module ApplicationHelper
  
  def flash_messages
    flash_types          = { success: "success", error: "danger", alert: "warning", notice: "info" }
    close_button_options = { class: "close", "data-dismiss" => "alert" }
    close_button         = content_tag(:button, "×", close_button_options)

    alerts =
      flash.map do |msg_type, message|
        alert_content = close_button + message
        flash_type    = flash_types[msg_type.to_sym] || msg_type
        alert_class   = "alert alert-#{flash_type} alert-dismissible"

        content_tag(:div, alert_content, class: alert_class, role: 'alert')
      end

    alerts.join("\n").html_safe
  end

end
