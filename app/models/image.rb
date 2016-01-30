class Image < ActiveRecord::Base
  belongs_to :chop

  has_attached_file :data, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :data, presence: true,
                       content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
                       size: { in: 0..20.megabytes }
  #validates :photo, attachment_presence: true
  #validates_with AttachmentPresenceValidator, attributes: :photo
  #validates_with AttachmentSizeValidator, attributes: :phot, less_than: 5.megabytes
end
