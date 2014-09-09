class Question
  include MongoMapper::EmbeddedDocument
  
  key :text, String
  key :instructions, String
  key :type, String, :required => true      # [["Title","title"],["SubTitle","subtitle"],["Divider","divider"],["Text Field","text"],["Text Box","paragraph"],["Multiple Choice","multiple_choice"],["Checkboxes","checkboxes"],["Drop Down List","list"],["If Then","ifthen"]]
  key :options, Array                       # ["option1","option2","hahaha"]
  key :ordinal, Integer, :required => true  # lets get some order here people
  
  # if type == ifthen && ifthen.if == answer then show second field
  
  validate :presence_of_text
  def presence_of_text
    errors.add(:base, "Question text is required.") if self.text.empty? && self.text != "divider"
  end
  
end