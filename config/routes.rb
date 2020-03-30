Rails.application.routes.draw do
  post :login, to: 'timing_vulnerabilities#login'

  resource :timing, controller: 'timing_vulnerabilities', only: [] do
    get :index
    match :login, via: %i(post get)
    match :conditional_hashing, via: %i(post get)
    match :string_comparison, via: %i(post get)
    match :basic_auth, via: %i(post get)
  end

  namespace :injections do
    resource :sql,  controller: 'sql_injections', only: [] do
      get :index
      match :raw_sql, via: %i(post get)
      match :raw_where, via: %i(post get)
    end

    resource :template, controller: 'template_injections', only: [] do
      get :index
      match :interpolation, via: %i(post get)
    end
  end

  resource :xss, controller: 'xss', only: [] do
    get :index
    get :parameter
  end

end
