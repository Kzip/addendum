class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :podpages
end
