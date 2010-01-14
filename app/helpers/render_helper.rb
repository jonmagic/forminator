module RenderHelper
  def question_to_html(question)
    html = ""
    required = question.required ? " <span style='color:red'>(required)</span>" : ""
    case question.type
      
    when "title"
      html << "<h1>#{question.text}</h1>"
    when "subtitle"
      html << "<h2>#{question.text}</h2>"
    when "divider"
      html << "<hr />"
    when "text"
      html << "<label class='standard'>#{question.text}<span class='small'>#{question.instructions}#{required}</span></label>"
      html << "<input type='text' id='questions_#{question.id}' name='questions[#{question.id}]' class='#{"required" if question.required}' />"
    when "paragraph"
      html << "<label class='standard'>#{question.text}<span class='small'>#{question.instructions}#{required}</span></label>"
      html << "<textarea id='questions_#{question.id}' name='questions[#{question.id}]' class='#{"required" if question.required}'></textarea>"
    when "multiple_choice"
      html << "<label class='standard'>#{question.text}<span class='small'>#{question.instructions}#{required}</span></label>"
      question.options.each { |option| html << "<div class='option'><input type='radio' id='questions_#{question.id}' name='questions[#{question.id}]' class='#{"required" if question.required}' value='#{option}' /> <span>#{option}</span></div>" }
    when "checkboxes"
      html << "<label class='standard'>#{question.text}<span class='small'>#{question.instructions}#{required}</span></label>"
      question.options.each { |option| html << "<div class='option'><input type='checkbox' id='questions_#{question.id}' name='questions[#{question.id}]' class='#{"required" if question.required}' value='#{option}' /> <span>#{option}</span></div>" }
    when "list"
      html << "<label>#{question.text}<span class='small'>#{question.instructions}#{required}</span></label>"
      html << "<select id='questions_#{question.id}' name='questions[#{question.id}]' class='#{"required" if question.required}'>"
      question.options.each { |option| html << "<option value='#{option}'>#{option}</option>" }
      html << "</select>"
    when "ifthen"
      html << "<label>#{question.text}<span class='small'>#{question.instructions}#{required}</span></label>"
    else
      raise "question is broken"
    end
    return html
  end
end