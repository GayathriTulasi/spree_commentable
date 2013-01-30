class Spree::Comment < ActiveRecord::Base
  attr_accessible :approve, :author, :comment, :email, :review, :city, :title, :created_at, :resource_id, :order, :resource_type, :show_on_main_page

  belongs_to :resource, polymorphic: true

  validates :email, :presence => true
  validates :author, :presence => true, :length => { :minimum => 3, :maximum => 100 }
  validates :comment, :presence => true, :length => { :minimum => 3, :maximum => 2000 }
  validates :city, :presence => true, :length => { :minimum => 3, :maximum => 20 }

  scope :approved, -> {where(:approve => true)}
  scope :not_approved, where(:approve => false)

  scope :current_comment, -> { where("created_at <= ?", Time.zone.now) }

  def all_comments
    Spree::Comments
  end
end
