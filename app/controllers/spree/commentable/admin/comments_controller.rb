class Spree::Admin::CommentsController < Spree::Admin::ResourceController


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
  
#   def new
#     @post = Spree::Post.new
#     @post.posted_at ||= Time.now
#   end

# private
  

  
#   def location_after_save
#     path = params[:redirect_to].to_s.strip.sub(/^\/+/, "/")
#     path.blank? ? object_url : path
#   end 
  
#   def find_resource
#     @object ||= Spree::Post.find_by_path(params[:id])
#   end
  
#   def collection
#     params[:search] ||= {}
#     params[:search][:meta_sort] ||= "posted_at.desc"
#     @search = Spree::Post.search(params[:q])
#     @collection = @search.result.page(params[:page]).per(Spree::Config[:orders_per_page])
#   end

end