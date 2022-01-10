ActiveAdmin.register Business do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :email, :is_owner, :is_approved, :location, :telephone, :website, :instagram, :opens_at, :closes_at, :business_type_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :is_owner, :is_approved, :location, :telephone, :website, :instagram, :opens_at, :closes_at, :business_type_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
