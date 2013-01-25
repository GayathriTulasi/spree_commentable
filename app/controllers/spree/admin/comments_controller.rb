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

      def change_resource
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

    end
  end
end
