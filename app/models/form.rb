class Form
  include MongoMapper::Document
  
  key :name, String, :require => true
  key :creator_id, Integer, :require => true
  key :created_at, Time, :require => true
  key :updated_at, Time
  
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
  
end