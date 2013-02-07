Spree::Product.class_eval do
  has_many :comments

  def approved_comments
    comments.approved
  end
end