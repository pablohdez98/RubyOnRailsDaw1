Rails.application.routes.draw do
  get 'admin/index'

  get 'admin/login'

  post 'admin/checkLogin', to: 'admin#checkLogin'

  get 'admin/logOut'

  get 'admin/newUser'

  get 'admin/newProduct'

  get 'admin/updateUser'

  get 'admin/updateProduct'

  get 'admin/destroyUser'

  get 'admin/destroyProduct'

  get 'admin/showUser'

  get 'admin/showProduct'

    #resources :users
    #get '/user/new' => 'users#new'
    namespace 'api' do
      namespace 'v1' do
        resources :users
      end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
