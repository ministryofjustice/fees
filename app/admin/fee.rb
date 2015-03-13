ActiveAdmin.register Fee do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  before_create do |fee|
    fee.fee_category_id = params["fee"]["fee_category_id"]
  end

  before_update do |fee|
    fee.fee_category_id = params["fee"]["fee_category_id"]
  end

  index do
    column :title
    column :amount
    column "Fee category" do |category|
      category.title
    end
    actions
  end

  form do |f|
    f.input :fee_category
    f.input :title
    f.input :amount
    actions
  end


  permit_params :title, :amount

end
