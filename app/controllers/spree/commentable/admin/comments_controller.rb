class Spree::Commentable::Admin::CommentsController < Spree::Admin::ResourceController

  def index
    respond_with(@collection)
  end

  def edit
    @comments = Spree::Commentable::Comment.find(params[:id])
  end

  def update
    invoke_callbacks(:update, :before)
    if @object.update_attributes(params['commentable_comment'])
      invoke_callbacks(:update, :after)
      flash[:success] = flash_message_for(@object, :successfully_updated)
      respond_with(@object) do |format|
        format.html { redirect_to edit_admin_comment_url }
        format.js   { render layout: false }
      end
    else
      invoke_callbacks(:update, :fails)
      respond_with(@object)
    end
  end

  def fast_approve
    Spree::Commentable::Comment.find(params[:id]).toggle!(:approve)
    redirect_to admin_comments_url
  end

  private
    def collection
      params[:search] ||= {}
      params[:search][:meta_sort] ||= "created_at.desc"
      @search = Spree::Commentable::Comment.search(params[:q])
      @collection = @search.result.page(params[:page]).per(10)
    end

  protected
  def model_class
      "Spree::Commentable::#{controller_name.classify}".constantize
  end
end