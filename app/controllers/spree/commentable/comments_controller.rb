class Spree::Commentable::CommentsController < Spree::BaseController
  def create
    @product = Spree::Product.find_by_permalink!(params[:product_id])
    @comment = @product.comments.create(params[:commentable_comment])
    redirect_to product_url(@product), notice: t(:comment_added_notice)
  end
end