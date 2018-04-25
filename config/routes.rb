Rails.application.routes.draw do

  root 'sessions#new'

  resources :sessions, path: I18n.t('routes.session')
  resources :users,    path: 'usuarios'
  resources :stores, path: I18n.t('routes.store') do
    resources :managers,    path: I18n.t('routes.manager')
    resources :sellers,     path: I18n.t('routes.seller')
    resources :owners,      path: I18n.t('routes.owner')
    resources :supervisors, path: I18n.t('routes.supervisor')

    resources :operations,  path: I18n.t('routes.operation') do
      resources :sales, path: I18n.t('routes.sale')
      resources :manager_avaliations,   path: I18n.t('routes.manager_avaliation') do
        resources :manager_avaliation_items, path: I18n.t('routes.manager_avaliation_item')
      end

      resources :avaliation_categories, path: I18n.t('routes.avaliation_category') do
        get 'copy', on: :collection
        post 'copy_create', on: :collection
      end

      resources :avaliation_items,      path: I18n.t('routes.avaliation_item') do
        get 'copy', on: :collection
        post 'copy_create', on: :collection
      end
      resources :reports
      resources :accounts
      resources :manager_objectives
      resources :indirect_teams
    end
  end
end
