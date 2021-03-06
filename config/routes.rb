Rails.application.routes.draw do

  get 'fee/:id', to: 'fee_types#show', as: 'fee'

  devise_for :users, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'statutory_instruments', to: 'statutory_instruments#index', as: 'statutory_instruments'
  get 'statutory_instrument/:id', to: 'statutory_instruments#show', as: 'statutory_instrument'
  root to: 'statutory_instruments#index'

  get 'categories', to: 'fee_categories#index', as: 'categories'
  get 'categories/:id', to: 'fee_categories#show', as: 'category'

  get 'search/fees'
  get 'fee_results', to: 'search#fee_results', as: 'fee_results'
end
