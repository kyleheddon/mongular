class Room < ActiveRecord::Base
  has_many :messages
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: true
  before_save :cleanse_name

  def cleanse_name
  	self.name = name.gsub(/[^\w\s]+/, '')
  end

  def url_encoded_name
  	name.downcase.gsub(' ', '_')
  end
end
