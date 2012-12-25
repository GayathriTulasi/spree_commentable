Deface::Override.new(:virtual_path  => "spree/layouts/admin",
                     :name          => "commentable_spree_products",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :partial       => "spree/admin/shared/commentable_contents_tab",
                     :disabled      => false)