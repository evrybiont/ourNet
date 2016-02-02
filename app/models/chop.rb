class Chop < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :images, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :images, allow_destroy: true
end
