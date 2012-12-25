Deface::Override.new(:virtual_path => "spree/products/show",
                     :replace => "[data-hook='product_show']",
                     :template => "spree/products/show",
                     :name => "product_show")
