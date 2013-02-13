class Spree::Commentable::Comment < ActiveRecord::Base

  attr_accessible :author, :comment, :email, :approve

  belongs_to :product

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :author, presence: true, length: { minimum: 3, maximum: 50 }
  validates :comment, presence: true, length: { minimum: 3, maximum: 2000 }

  scope :only_approved_comments, where(approve: true)

end