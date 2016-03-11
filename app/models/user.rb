class User < ActiveRecord::Base
  TYPES = ['Visitor', 'Builder', 'Event Manager']

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :avatar, styles: {medium: '230x230#', thumb: '100x100#'},
                    storage: :s3,
                    s3_credentials: {
                      bucket: ENV['S3_AVATARS_BUCKET'],
                      access_key_id: ENV['S3_KEY'],
                      secret_access_key: ENV['S3_SECRET']
                    },
                    url: ':s3_domain_url',
                    path: '/:class/:attachment/:id_partition/:style/:filename',
                    s3_region: ENV['S3_REGION']

  crop_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :chops, dependent: :destroy

  validates :user_type, presence: true, inclusion: {in: TYPES}, on: :update
  validates :name, presence: true
  validates :avatar, dimensions: { width: 1050, height: 1050 }

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
