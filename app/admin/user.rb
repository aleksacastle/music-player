ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :email, :password, :password_confirmation, :role, :first_name, :last_name, :nick_name

  index do
    id_column
    column :avatar do |img|
      image_tag img.avatar.url(:thumb) if img.avatar.url.present?
    end
    column :email
    column :first_name
    column :last_name
    column :nick_name
    column :role
    column :sign_in_count
    actions
  end

  form do |f|
    f.inputs "User" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :nick_name
      f.input :role
      actions
    end
  end
end
