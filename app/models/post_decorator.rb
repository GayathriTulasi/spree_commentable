Spree::Post.class_eval do
  has_many :comments, as: :resource

  def approved_comments
    comments.approved
  end
end