class Spree::Commentable::CommentsController < Spree::BaseController
  def create
    @product = Spree::Product.find_by_permalink!(params[:product_id])
    @comment = @product.comments.new(params[:commentable_comment])
    if @comment.save
      redirect_to product_url(@product), notice: t(:comment_added_notice)
    else
      redirect_to product_url(@product), flash: { error: t(:comment_not_added) }
    end
  end
end