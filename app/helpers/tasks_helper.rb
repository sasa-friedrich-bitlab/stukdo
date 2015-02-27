module TasksHelper

  def state_links(task)
    case task.state
    when "to_do"
      link_to "<i class='fa fa-arrow-right'></i>".html_safe, change_task_path(task, state: "doing"), method: :put, class: "btn btn-block btn-info"
    when "doing"
      html = "<div class='btn-group btn-group-justified'>"
      html << link_to("<i class='fa fa-arrow-left'></i>".html_safe, change_task_path(task, state: "to_do"), method: :put, class: "btn btn-info")
      html << link_to("<i class='fa fa-arrow-right'></i>".html_safe, change_task_path(task, state: "done"), method: :put, class: "btn btn-info")
      html << "</div>"
      html.html_safe
    when "done"
      link_to "<i class='fa fa-arrow-left'></i>".html_safe, change_task_path(task, state: "doing"), method: :put, class: "btn btn-block btn-info"
    end
  end

end
