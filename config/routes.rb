Rails.application.routes.draw do
  get 'fee/:id', to: 'fee_types#show', as: 'fee'

  devise_for :users, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'general_applications' => 'general_applications#index'
  get 'general_applications/:id', to: 'general_applications#show'

  get 'categories' => 'fee_categories#index'
  get 'categories/:id', to: 'fee_categories#show', as: 'category'
end
