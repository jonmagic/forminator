module FormsHelper
  def options_helper(question)
    ""
  end
  
  def question_icon_helper(question)
    html = ""
    case question.type
    when "title"
      html << "<span class='ui-icon ui-icon-arrowthick-1-e float-left'></span>"
    when "subtitle"
      html << "<span class='ui-icon ui-icon-arrowthick-1-e float-left'></span>"
    when "divider"
      html << "<span class='ui-icon ui-icon-minus float-left'></span>"
    when "text"
      html << "<span class='ui-icon ui-icon-help float-left'></span>"
    when "paragraph"
      html << "<span class='ui-icon ui-icon-help float-left'></span>"
    when "multiple_choice"
      html << "<span class='ui-icon ui-icon-radio-off float-left'></span>"
    when "checkboxes"
      html << "<span class='ui-icon ui-icon-check float-left'></span>"
    when "list"
      html << "<span class='ui-icon ui-icon-grip-solid-horizontal float-left'></span>"
    when "ifthen"
      html << "<span class='ui-icon ui-icon-help float-left'></span>"
    else
      raise "question is broken"
    end
    return html
  end
end
