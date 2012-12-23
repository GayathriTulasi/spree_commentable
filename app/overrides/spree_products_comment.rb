Deface::Override.new(:virtual_path  => "spree/layouts/admin",
                     :name          => "spree_products_comment",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :partial       => "spree/commentable/admin/shared/contents_tab",
                     :disabled      => false)