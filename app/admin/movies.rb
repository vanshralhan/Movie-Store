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

permit_params :title, :genre, :plot, :image, :rating, :web, :year, :view
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
filter :genre

  action_item :new_movie, only: :index do
    link_to "Movie Upload Via Api", Figaro.env.Automatic_Movie_Uri
  end

  form :html => { :enctype => "multipart/form-data"} do |f|
    f.inputs do
      render "movies/form", {movie: movie, view: params[:view]}
    end
  end
end
