class Chop < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :images, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :images, allow_destroy: true

  scope :active, ->{where(visible: true).order(created_at: :desc)}


  def state_title
    visible? ? 'Visible' : 'Add some photos'
  end

  def state_icon
    visible? ? 'circle green' : 'warning'
  end

  def image
    images.first.data.url(:medium)
  end
end
