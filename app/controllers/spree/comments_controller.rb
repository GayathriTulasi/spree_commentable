module Spree
  class CommentsController < Spree::BaseController
    def create
      if params.include?(:$product_id)
        @resource = Spree::Product.find_by_permalink(params[:product_id])
      else
        @resource = Spree::Post.find_by_path(params[:id])
      end
      @comment = @resource.comments.create(params[:comment])
      if params.include?(:$product_id)
        redirect_to "/products/#{@resource.permalink}", :notice => t(:comment_added_notice)
      else
        redirect_to "/#{@resource.blog.permalink}/#{@resource.path}", :notice => t(:comment_added_notice)
      end
    end
  end
end
