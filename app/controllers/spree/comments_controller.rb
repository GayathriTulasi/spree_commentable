module Spree
  class CommentsController < Spree::BaseController
    def create
      @resource = Spree::Product.find_by_permalink(params[:product_id])
      @comment = @resource.comments.create(params[:comment])
      redirect_to "/products/#{@resource.permalink}", :notice => t(:comment_added_notice)
    end
  end
end
