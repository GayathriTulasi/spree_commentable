Deface::Override.new(:virtual_path => "spree/products/show",
                     :replace => "[data-hook='product_show']",
                     :template => "spree/products/commentable_show",
                     :name => "commentable_product_show")
