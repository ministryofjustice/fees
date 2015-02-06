ActiveAdmin.register FeeCategory do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :title
    actions
  end

  form do |f|
    f.input :title
    actions
  end

  permit_params :title
end
