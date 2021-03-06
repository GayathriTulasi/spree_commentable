class Spree::CommentsController < Spree::BaseController
  def create
    @product = Spree::Product.find_by_permalink!(params[:product_id])

    params[:comment][:email] = spree_current_user.email if user_signed_in?

    @comment = @product.comments.new(params[:comment])
    if @comment.save
      redirect_to product_url(@product), notice: t(:comment_added_notice)
    else
      redirect_to product_url(@product), flash: { error: t(:comment_not_added) }
    end
  end
end