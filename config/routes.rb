Rails.application.routes.draw do
  resource :timing, controller: 'timing_vulnerabilities', only: [] do
    get :index
    match :login, via: %i(post get)
    match :conditional_hashing, via: %i(post get)
    match :string_comparison, via: %i(post get)
  end

  resource :sql,  controller: 'sql_injections', only: [] do
    get :index
    match :raw_sql, via: %i(post get)
    match :raw_where, via: %i(post get)
  end


end
