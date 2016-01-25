class Song < ActiveRecord::Base
  has_and_belongs_to_many :albums
  validates :name, presence: true, uniqueness: true
end
