Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get    'team6s/index' => 'team6s#index'
  get    'team6s/new'   => 'team6s#new'
  post   'shindans'     => 'team6s#create'
  root   'team6s#index'
  get    'team6s/type1/:id' => 'team6s#type1',as: 'team6type1'
  get    'team6s/type2/:id' => 'team6s#type2',as: 'team6type2'
  get    'team6s/type3/:id' => 'team6s#type3',as: 'team6type3'
  get    'team6s/type4/:id' => 'team6s#type4',as: 'team6type4'
  get    'team6s/type5/:id' => 'team6s#type5',as: 'team6type5'
  get    'team6s/:id'   => 'team6s#show',as: 'team6'
end

