Rails.application.routes.draw do
  get 'general_applications' => 'general_applications#index'
  get 'general_applications/:id', to: 'general_applications#show'
end
