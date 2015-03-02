Rails.application.routes.draw do

  get 'fee/:id', to: 'fee_types#show', as: 'fee'

  devise_for :users, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'statutory_instruments', to: 'statutory_instruments#index', as: 'statutory_instruments'
  get 'statutory_instrument', to: 'statutory_instruments#show', as: 'statutory_instrument'

  get 'categories', to: 'fee_categories#index', as: 'categories'
  get 'categories/:id', to: 'fee_categories#show', as: 'category'
  root to: 'fee_categories#index'

  get 'search/fees'
  get 'fee_results', to: 'search#fee_results', as: 'fee_results'
end
