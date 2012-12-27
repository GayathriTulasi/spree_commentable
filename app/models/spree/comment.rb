class Spree::Comment < ActiveRecord::Base
  attr_accessible :approve, :author, :comment, :email, :review, :city

  belongs_to :resource, polymorphic: true

  validates :email, :presence => true
  validates :author, :presence => true, :length => { :minimum => 3, :maximum => 100 }
  validates :comment, :presence => true, :length => { :minimum => 3, :maximum => 2000 }
  validates :city, :presence => true, :length => { :minimum => 3, :maximum => 20 }

  scope :approved, where(:approve => true)
  scope :not_approved, where(:approve => false)

  scope :review, where(:review => true)
  def all_comments
    Spree::Comments.review
  end
end
