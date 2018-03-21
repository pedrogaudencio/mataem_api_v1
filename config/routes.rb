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
        get :show_from_user, on: :member
      end

      resources :addresses
      resources :areas
      resources :cities
      resources :restaurants do
        get :get_featured, on: :collection
        resources :social_media, on: :member
        resources :vendors, on: :member do
          put :update_delivery_areas
        end
      end

      resources :vendors do
        get :get_cuisine, on: :collection
        get :get_category, on: :collection
        get :just_opened, on: :collection
        get :free_delivery, on: :collection
        get :delivers_in, on: :collection
        get :is_busy, on: :member
        get :get_cuisine_category_delivery_area, on: :collection
        get '/menu_items_by_category', to: 'menu_items#by_category'
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
      post '/orders_profile', to: 'orders#index_profile'
      post '/addresses_profile', to: 'addresses#index_profile'
      get '/menu_items', to: 'menu_items#index'
      get '/order_assignments_by_delivery_boy', to: 'order_assignments#by_delivery_boy'
      resources :menu_item_cuisines
      resources :menu_item_categories

      resources :enquiries
      resources :questions do
        resources :answers
      end
      get '/reviews_admin', to: 'reviews#index_admin'
      resources :reviews
      resources :order_items
      resources :orders, on: :member do
        resources :order_assignment_issues, on: :member
      end
      resources :coupons do
        get :get_by_code, to: 'coupons#get_by_code', on: :collection
      end
      resources :advertisements, on: :member do
        get 'click', to: 'advertisements#click', on: :member
      end

      get :most_sold_item, to: 'reports#most_sold_item'
      # RMA REPORTS
      scope 'rma-reports' do
        get :best_selling_areas, to: 'reports#overall_best_selling_areas'
        get :best_selling_items, to: 'reports#overall_best_selling_items'
        get :daily_sales, to: 'reports#overall_daily_sales'
        get :monthly_sales, to: 'reports#overall_monthly_sales'
        get :rejected_orders, to: 'reports#rejected_orders'
        get :busy_resturants, to: 'reports#busy_resturants'
        get :delivery_boys, to: 'reports#delivery_boys'
      end
    end
  end
end
