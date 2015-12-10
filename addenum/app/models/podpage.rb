class Podpage < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :podcasts

  validates :name,  presence: true, length: { in: 2..20 }
end
