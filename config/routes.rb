require 'constraints/api_constraints'
MarketRestfulApi::Application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1 do
              constraints(ApiConstraints.new(version: 1, default: true)) do

              end
    end
  end
end
