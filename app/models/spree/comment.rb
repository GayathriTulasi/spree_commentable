class Spree::Comment < ActiveRecord::Base

  attr_accessible :approve, :author, :comment, :email, :review, :city, :created_at, :resource_id, :order, :resource_type


  belongs_to :resource, polymorphic: true

  validates :email, :presence => true
  validates :author, :presence => true, :length => { :minimum => 3, :maximum => 100 }
  validates :comment, :presence => true, :length => { :minimum => 3, :maximum => 2000 }
  validates :city, :presence => true, :length => { :minimum => 3, :maximum => 20 }

  scope :approved, -> {where(:approve => true)}
  scope :not_approved, where(:approve => false)

  scope :current_comment, -> { where("created_at <= ?", Time.zone.now) }

  scope :review, where(:review => true)
  scope :not_review, where(:review => false)
  def all_comments
    Spree::Comments.review
  end
end
