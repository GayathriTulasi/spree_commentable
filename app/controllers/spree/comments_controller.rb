module Spree
  class CommentsController < Spree::BaseController
    def create
      @resource = Spree::Page.find(params[:page_id])
      @comment = @resource.comments.create(params[:comment])
      redirect_to "/#{@resource.slug}", :notice => t(:comment_added_notice)
    end
  end
end
