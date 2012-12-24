class Spree::CommentsController < Spree::BaseController
  def create
    @product = Spree::Product.find_by_permalink(params[:product_id])
    @comment = @product.comments.create(params[:comment])
    redirect_to "/products/#{@product.permalink}", :notice => t(:comment_added_notice)
  end
end
