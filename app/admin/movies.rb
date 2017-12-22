ActiveAdmin.register Movie do
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

permit_params :title, :genre, :plot, :image, :rating, :web, :year
 decorate_with MovieDecorator
index do
  selectable_column
  id_column
  column :title
  column :genre
  column :plot
  column :image
  column :rating
  column :web
  column :year
  actions
end

filter :title

form do |f|
  f.inputs do
    f.input :title
    f.input :genre
    f.input :plot
    f.input :image
    f.input :rating
    f.input :web
    f.input :year
  end
  f.actions
end
end
