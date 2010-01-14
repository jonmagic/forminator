class Form
  include MongoMapper::Document
  
  key :name, String, :require => true
  key :creator_id, Integer, :require => true
  key :created_at, Time, :require => true
  key :updated_at, Time
  key :recipients, Array
  key :submit_button, String
  key :message, Hash
  
  has_many :questions
  
  validate :prevent_duplicates
  def prevent_duplicates
    if existing_forms = Form.all(:name => self.name, :creator_id => self.creator_id)
      duplicate = false
      existing_forms.each { |form| duplicate = true if form.id != self.id }
      errors.add(:base, "You already have a form named #{self.name}.") if duplicate
    end
  end
  
  before_create :set_created_at
  before_update :set_updated_at
  def set_created_at
    self.created_at = Time.now
    set_updated_at
  end
  def set_updated_at
    self.updated_at = Time.now
  end
  
  before_create :set_default_message
  def set_default_message
    self.message['title'] = "Thank You"
    self.message['body']  = "Thank you for taking the time to fill out our form. Have a great day!"
  end
  
  before_update :recipients_to_array
  def recipients_to_array
    self.recipients = self.recipients.to_s.split(',')
  end
  
  def reorder(question_ids)
    valid_question_ids = questions.collect(&:id)
    question_ids = question_ids.map { |id| ObjectId.to_mongo(id) }
    question_ids.delete_if { |id| !valid_question_ids.include?(id) }
    questions.sort! { |a, b| question_ids.index(a.id) <=> question_ids.index(b.id) }
    save
  end
  
end