Rails.application.routes.draw do
  resources :sessions, path: I18n.t('routes.session')

  resources :stores, path: I18n.t('routes.store') do
    resources :managers, path: I18n.t('routes.manager')
    resources :sellers,  path: I18n.t('routes.seller')
  end

end
