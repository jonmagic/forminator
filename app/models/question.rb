class Question
  include MongoMapper::EmbeddedDocument
  
  key :text, String, :required => true
  key :type, String, :required => true # [["Text Field","text"],["Text Box","paragraph"],["Multiple Choice","multiple_choice"],["Checkboxes","checkboxes"],["Drop Down List","list"],["If Then","ifthen"]]
  key :options, Hash # {"choices" => ["option1","option2"]}, {"answers" => ["MI","IN","OH"]}
  key :order, Integer, :required => true

  
  
  # if type == ifthen && ifthen.if == answer then show second field
  
end