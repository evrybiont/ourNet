class Album < ActiveRecord::Base
  has_and_belongs_to_many :songs
  validates :name, presence: true, uniqueness: true
end
