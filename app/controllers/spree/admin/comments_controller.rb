class Spree::Admin::CommentsController < Spree::Admin::ResourceController

  def fast_approve
    Spree::Comment.find(params[:id]).toggle!(:approve)
    redirect_to admin_comments_url
  end

  private
    def collection
      params[:search] ||= {}
      params[:search][:meta_sort] ||= "created_at.desc"
      @search = Spree::Comment.search(params[:q])
      @collection = @search.result.page(params[:page]).per(10)
    end
end