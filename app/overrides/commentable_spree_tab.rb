Deface::Override.new(virtual_path: "spree/layouts/admin",
                     name:         "commentable_spree_tab",
                     insert_bottom:"[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     partial:      "spree/admin/shared/commentable_spree_tab",
                     disabled:     false)