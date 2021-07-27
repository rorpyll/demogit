ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :branch_name, :image, :title, :description, :price, :product_type, :model_number
  #
  # or
  #
  # permit_params do
  #   permitted = [:branch_name, :image, :title, :description, :price, :product_type, :model_number]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :branch_name, :image, :title, :description, :price, :product_type, :model_number, :category_id
end
