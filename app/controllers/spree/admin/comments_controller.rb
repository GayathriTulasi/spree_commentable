module Spree
  module Admin
    class CommentsController < Spree::Admin::ResourceController


      def show
        redirect_to action: :edit
      end

      def approve
        comment = Spree::Comment.find(params[:id])
        if params[:flag] == 'true'
          comment.update_attributes(approve: false)
        else
          comment.update_attributes(approve: true)
        end

        redirect_to action: :index
      end

      def create
        params[:comment][:resource_type] = params[:resource_type]
        params[:post_resource_id].present? ? params[:comment][:resource_id] = params[:post_resource_id] : params[:comment][:resource_id] = params[:product_resource_id]
        @comment = Spree::Comment.new(params[:comment])
        @comment.save
        redirect_to action: :index
      end

      def  resource_filter
        return redirect_to action: :index if params[:product_id].present? && params[:post_id].present? || params[:product_id].blank? && params[:post_id].blank?

        params[:search] ||= {}
        params[:search][:meta_sort] ||= "created_at.desc"
        @search = Spree::Comment.search(params[:q])
        if params[:product_id].present?
          @collection = Spree::Comment.where('resource_type = ? AND resource_id = ?', 'Spree::Product', params[:product_id].to_i).page(params[:page]).per(10)
        else
          @collection = Spree::Comment.where('resource_type = ? AND resource_id = ?', 'Spree::Post', params[:post_id].to_i).page(params[:page]).per(10)
        end
        render :index
      end

      def change_resource
        redirect_to action: :edit if params[:post_resource_id].blank? && params[:product_resource_id].blank?
        resource_type = params[:resource_type]
        params[:post_resource_id].present? ? resource_id = params[:post_resource_id] : resource_id = params[:product_resource_id]
        comment = Spree::Comment.find(params[:id])
        comment.update_attributes(:resource_type => resource_type, :resource_id => resource_id)
        redirect_to action: :edit
      end

      private
        def collection
          params[:search] ||= {}
          params[:search][:meta_sort] ||= "created_at.desc"
          @search = Spree::Comment.search(params[:q])
          if params[:num].present?
            @collection = @search.result.page(params[:page]).per(100)
          else
            @collection = @search.result.page(params[:page]).per(10)
          end
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
  end
end
