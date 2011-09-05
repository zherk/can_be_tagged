class Tag < ActiveRecord::Base
  has_many :tag_lines, :dependent => :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
  
  def to_s
    name
  end
  
end
