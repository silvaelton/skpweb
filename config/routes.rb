Rails.application.routes.draw do

  root 'sessions#new'

  resources :sessions, path: I18n.t('routes.session')

  resources :stores, path: I18n.t('routes.store') do
    resources :managers,    path: I18n.t('routes.manager')
    resources :sellers,     path: I18n.t('routes.seller')
    resources :operations,  path: I18n.t('routes.operation') do
      resources :sales, path: I18n.t('routes.sale')
    end
  end

end
