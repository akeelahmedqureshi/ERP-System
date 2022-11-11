Rails.application.routes.draw do
  devise_for :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "home#index"
  # root "new_employee_session_path"


  namespace :admin do 
    resources :employees, :projects, :issues, :attendence
    resources :notice, only: [:index, :show]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
