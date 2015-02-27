module TasksHelper

  def state_links(task)
    case task.state
    when "to_do"
      link_to "<i class='fa fa-arrow-right'></i>".html_safe, change_task_path(task, state: "doing"), method: :put, class: "btn btn-block btn-info"
    when "doing"
      html =  content_tag(:div, class: "btn-group btn-group-justified") do
                concat link_to "<i class='fa fa-arrow-left'></i>".html_safe, change_task_path(task, state: "to_do"), method: :put, class: "btn btn-info"
                concat link_to "<i class='fa fa-arrow-right'></i>".html_safe, change_task_path(task, state: "done"), method: :put, class: "btn btn-info"
              end
      html.html_safe
    when "done"
      link_to "<i class='fa fa-arrow-left'></i>".html_safe, change_task_path(task, state: "doing"), method: :put, class: "btn btn-block btn-info"
    end
  end

end
