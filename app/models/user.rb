class User < ActiveRecord::Base
  TYPES = ['Visitor', 'Builder', 'Event Manager']

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :chops

  validates :user_type, presence: true, inclusion: {in: TYPES}, on: :update
  validates :name, presence: true

  class << self
    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.image = auth.info.image
        user.link = auth.extra.raw_info.link
      end
    end
  end
end
