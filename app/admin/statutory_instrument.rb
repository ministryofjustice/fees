ActiveAdmin.register StatutoryInstrument do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :title
    column :description
    column :coming_into_force
    actions
  end

  form do |f|
    f.input :title
    f.input :description
    f.input :coming_into_force
    actions
  end

  permit_params :title, :description, :coming_into_force
end
