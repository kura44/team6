Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'team6s/index' =>'team6s#index'
  get 'team6s/new' => 'team6s#new'
  post 'shindans' => 'team6s#create'
  root 'team6s#index'
  get    'team6s/type1'      => 'team6s#type1'
  get    'team6s/type2'      => 'team6s#type2'
  get    'team6s/type3'      => 'team6s#type3'
  get    'team6s/type4'      => 'team6s#type4'
  get    'team6s/type5'      => 'team6s#type5'
end

