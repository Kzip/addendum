class Podcast < ActiveRecord::Base
  belongs_to :podpage
  has_attached_file :cast
  validates_attachment_content_type :cast, :content_type => /.*/
end
