Rails.application.routes.draw do

  root 'sessions#new'

  resources :sessions, path: I18n.t('routes.session')

  resources :stores, path: I18n.t('routes.store') do
    resources :managers,    path: I18n.t('routes.manager')
    resources :sellers,     path: I18n.t('routes.seller')
    resources :operations,  path: I18n.t('routes.operation') do
      resources :sales, path: I18n.t('routes.sale')
      resources :manager_avaliations,   path: I18n.t('routes.manager_avaliation')
      resources :avaliation_categories, path: I18n.t('routes.avaliation_category')
      resources :avaliation_items,      path: I18n.t('routes.avaliation_item')
    end
  end
end
