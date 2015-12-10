class Addendum < ActiveRecord::Base
  belongs_to :podcast
  has_attached_file :addendum
  validates_attachment_content_type :addendum, :content_type => /.*/
end
