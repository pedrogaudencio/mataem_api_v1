Rails.application.routes.draw do
  # devise_for :users, controllers: {omniauth_callbacks: 'callbacks'}

  # /api/v1/
  namespace :api do #, defaults: { format: 'jsonapi' } do
    # versioning: http://railscasts.com/episodes/350-rest-api-versioning
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :omniauth
      resources :omniauth_facebook

      resources :profiles do
        get :get_mobile_verification_code, on: :member
        post :verify_mobile_number, on: :member
        post :change_mobile_number, on: :member
        get :activate_profile, on: :member
        get :deactivate_profile, on: :member
        get :block_profile, on: :member
      end

      resources :addresses
      resources :areas
      resources :cities
      resources :restaurants do
        resources :social_media, on: :member
        resources :vendors, on: :member
      end

      resources :vendors do
        get :get_cuisine, on: :collection
        get :get_category, on: :collection
        get :just_opened, on: :collection
        get :free_delivery, on: :collection
        get :delivers_in, on: :collection
        resources :menu_items do
          resources :menu_item_cuisines
          resources :menu_item_categories
          resources :item_choices do
            resources :item_choice_variants
          end
        end
        resources :reviews
        resources :orders do
          member do
            resources :order_items
            resources :order_assignments do
              get :list_pending, on: :member
              post :accept_assignment, on: :member
            end
          end
        end
      end
      resources :menu_item_cuisines
      resources :menu_item_categories

      resources :enquiries
      resources :questions do
        resources :answers
      end
      resources :reviews
      resources :order_items
      resources :orders
    end
  end
end
