Spree::Product.class_eval do
  has_many :comments, as: :resource, dependent: :destroy

  def approved_comments
    comments.approved.current_comment
  end

  def review_comments
    comments.review.limit(3)
  end
end