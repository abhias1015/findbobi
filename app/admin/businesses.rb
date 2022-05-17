ActiveAdmin.register Business do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :email, :is_owner, :is_approved, :tag_list, :language_list, :location, :telephone, :website, :instagram, :opens_at, :closes_at, :business_type_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :is_owner, :is_approved, :location, :telephone, :website, :instagram, :opens_at, :closes_at, :business_type_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  action_item :only => :index do
    link_to 'Upload CSV', :action => 'upload_csv'
  end

  collection_action :upload_csv do
    render "admin/csv/upload_csv"
  end

  collection_action :import_csv, :method => :post do
    CsvDb.convert_save("business", params[:dump][:file])
    redirect_to :action => :index, :notice => "CSV imported successfully!"
  end

  form do |f|
    f.inputs "Business info" do
      f.input :business_type
      f.input :name
      f.input :email
      f.input :is_owner
      f.input :is_approved
      f.input :location
      f.input :telephone
      f.input :website
      f.input :instagram
      f.input :opens_at
      f.input :closes_at
      f.input :tag_list
      f.input :language_list
      # f.input :tags,  # Show all tags AND checked already selected one (by relations through :tags - input must named :tags)
      #   as: :select,
      #   multiple: :true,
      #   collection: ActsAsTaggableOn::Tag.select(:id, :name).all
      # f.input :languages,  # Show all tags AND checked already selected one
      #   as: :select,
      #   multiple: :true,
      #   collection: ActsAsTaggableOn::Tag.select(:id, :name).all
    end
    f.actions
  end
end
