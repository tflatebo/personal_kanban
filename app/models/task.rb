class Task < ActiveRecord::Base
  attr_accessible :content, :name, :priority

  validates :user_id,  :presence     => true
  validates :name,     :presence     => true
  validates :priority, :presence     => true,
                       :uniqueness   => true,
                       :numericality => { :only_integer => true, :greater_than => 0 }
  
  belongs_to :user
end
