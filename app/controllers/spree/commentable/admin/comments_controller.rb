class Spree::Commentable::Admin::CommentsController < Spree::Admin::ResourceController

  def show
    redirect_to action: :edit
  end

  private
    def collection
      params[:search] ||= {}
      params[:search][:meta_sort] ||= "created_at.desc"
      @search = Spree::Comment.search(params[:q])
      @collection = @search.result.page(params[:page]).per(10)
    end

end