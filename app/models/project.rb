class Project < ActiveRecord::Base
  include PublicActivity::Common
  
  attr_accessible :description, :name
  has_and_belongs_to_many :users
  has_many :tasks
  
  validates :name, :presence => true
end
