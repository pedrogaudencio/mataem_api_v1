Rails.application.routes.draw do
  if Rails.env.development?
    apipie
  end
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
        get '/list_pending_order_assignments', to: 'order_assignments#list_pending'
        resources :orders, on: :member do
          resources :order_items
          get :filter_status, on: :member
          get :filter_progress, on: :member
          get :filter_delivery_type, on: :member
          resources :order_assignments, on: :member do
            post :accept_assignment, on: :member
          end
        end
      end
      get '/orders_admin', to: 'orders#index_admin'
      get '/menu_items', to: 'menu_items#index'
      resources :menu_item_cuisines
      resources :menu_item_categories

      resources :enquiries
      resources :questions do
        resources :answers
      end
      resources :reviews
      resources :order_items
      resources :orders, on: :member do
        resources :order_assignment_issues, on: :member
      end
      resources :coupons
      resources :advertisements, on: :member do
        get 'click', to: 'advertisements#click', on: :member
      end
      scope '/reports' do
        get :best_selling_area, to: 'reports#best_selling_area'
        get :most_selling_items, to: 'reports#most_selling_items'
        get :daily_sales, to: 'reports#daily_sales'
        get :monthly_sales, to: 'reports#monthly_sales'
        get :best_selling_restaurant, to: 'reports#best_selling_restaurant'
        get :mataem_revenue, to: 'reports#mataem_revenue'
        get :restaurant_performance, to: 'reports#restaurant_performance'
        get :due_payments, to: 'reports#due_payments'
        # get :busiest_restaurant, to: 'reports#'
        # get :delivery_boy, to: 'reports#'
        # get :rejected_orders, to: 'reports#'
      end
    end
  end
end
