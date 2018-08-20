
[1mFrom:[0m /home/long-pnth/Desktop/ecommerce-long/ecommerce-pnth/app/controllers/admin/categories_controller.rb @ line 30 Admin::CategoriesController#update:

    [1;34m28[0m: [32mdef[0m [1;34mupdate[0m
    [1;34m29[0m: 
 => [1;34m30[0m:   binding.pry
    [1;34m31[0m:   
    [1;34m32[0m:   [1;34m# parent_id = params[:category][:parent_id][0m
    [1;34m33[0m:   [32mif[0m parent_id.nil?
    [1;34m34[0m:     parent_id = [1;34m0[0m
    [1;34m35[0m:   [32melse[0m
    [1;34m36[0m:     parent_id = params[[33m:category[0m][[33m:parent_id[0m]
    [1;34m37[0m:   [32mend[0m
    [1;34m38[0m:   [1;34m# if parent_id.nil?[0m
    [1;34m39[0m:   [1;34m# else[0m
    [1;34m40[0m:   [1;34m# end[0m
    [1;34m41[0m:   [32mif[0m @category.update_attributes category_params
    [1;34m42[0m:     flash[[33m:notice[0m] = [31m[1;31m"[0m[31medit thành công[1;31m"[0m[31m[0m
    [1;34m43[0m:     redirect_to admin_categories_path
    [1;34m44[0m:   [32melse[0m 
    [1;34m45[0m:     render [31m[1;31m'[0m[31medit[1;31m'[0m[31m[0m
    [1;34m46[0m:   [32mend[0m
    [1;34m47[0m: [32mend[0m

