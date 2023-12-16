Rails.application.routes.draw do
  get 'home/index'
  # Trang chủ
  root 'home#index'

  # Đăng ký
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  # Đăng nhập
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  # Đăng xuất
  delete 'logout', to: 'sessions#destroy'
end
