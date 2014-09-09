module RenderHelper
  def question_to_html(question)
    html = ""
    case question.type
      
    when "title"
      html << "<h1>#{question.text}</h1>"
    when "subtitle"
      html << "<h2>#{question.text}</h2>"
    when "divider"
      html << "<hr />"
    when "text"
      html << "<label class='standard'>#{question.text}<span class='small'>#{question.instructions}</span></label>"
      html << "<input type='text' id='question_#{question.id}' name='question[#{question.id}]' />"
    when "paragraph"
      html << "<label class='standard'>#{question.text}<span class='small'>#{question.instructions}</span></label>"
      html << "<text type='text' id='question_#{question.id}' name='question[#{question.id}]'></text>"
    when "multiple_choice"
      html << "<label class='standard'>#{question.text}<span class='small'>#{question.instructions}</span></label>"
      question.options.each { |option| html << "<div class='option'><input type='radio' id='question_#{question.id}' name='question[#{question.id}][#{option}]' /> <span>#{option}</span></div>" }
    when "checkboxes"
      html << "<label class='standard'>#{question.text}<span class='small'>#{question.instructions}</span></label>"
      question.options.each { |option| html << "<div class='option'><input type='checkbox' id='question_#{question.id}' name='question[#{question.id}][#{option}]' /> <span>#{option}</span></div>" }
    when "list"
      html << "<label>#{question.text}<span class='small'>#{question.instructions}</span></label>"
      html << "<select id='question_#{question.id}' name='question[#{question.id}]>"
      question.options.each { |option| html << "<option value='#{option}'>#{option}</option>" }
      html << "</select>"
    when "ifthen"
      html << "<label>#{question.text}<span class='small'>#{question.instructions}</span></label>"
    else
      raise "question is broken"
    end
    return html
  end
end