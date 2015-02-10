ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
          para "Edit Fee Categories, above, to create a new category."
          para "Edit Fee types, above, to create new fees under a category."
        end
      end
    end
  end
end
