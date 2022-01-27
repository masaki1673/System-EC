Rails.application.routes.draw do

# devise_for :customers, skip: [:passwords], controllers: {
#     registrations: "publics/registrations",
#     sessions: 'publics/sessions'
# }



devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
namespace :admin do
 get '/homes' => 'homes#top'

    resources :items, only: [:index, :create, :show, :edit, :update, :new]
    resources :genres, only:[:index, :edit, :create, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
  end
scope module: :public do
root to:'homes#top'
get '/homes' => 'homes#top'
get '/homes/about' => 'homes#about'
    resources :items, only:[:index, :show]
get '/customers/my_page' => 'customers#show'
get '/customers/edit' => 'customers#edit'
patch '/customers/update'  => 'customers#update'
get '/customers/unsubscribe' => 'customers#unsubscribe'
patch '/customers/withdraw'  => 'customers#withdraw'
    resources :cart_items, only:[:index, :update, :destroy, :create]
get '/orders/complete' => 'orders#complete'
# post '/cart_items' => 'cart_items#create'
get '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only:[:new, :create, :index, :show]
post '/orders/confirm' => 'orders#confirm'
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :order_details, only:[:update]
end
devise_for(
    :customers,
    path: 'customers',
    module: 'publics'
)
end
