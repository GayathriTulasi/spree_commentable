Spree::Product.class_eval do
  has_many :comments, as: :resource, dependent: :destroy

  def approved_comments
    comments.approved.current_comment.order("`spree_comments`.`order`")
  end

  def review_comments
    comments.review
  end
end