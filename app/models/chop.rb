class Chop < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  acts_as_likeable

  belongs_to :user
  has_many :images, dependent: :destroy

  delegate :id, :name, to: :user, prefix: true

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :images, allow_destroy: true

  scope :active, ->{where(visible: true).includes(:images).order(created_at: :desc)}


  def state_title
    visible? ? 'Visible' : 'Add some photos'
  end

  def state_icon
    visible? ? 'check green' : 'warning'
  end

  def image
    images.first.data.url(:original)
  end

  def user_avatar
    user.avatar.url(:thumb)
  end
end
