ActiveAdmin.register FeeType do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end


  index do
    column "Fee category" do |category|
      link_to category.title, admin_fee_category_path(category.id)
    end
    column :title
    column :amount
    actions
  end

  permit_params :title, :amount

end
