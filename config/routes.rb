Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  mount_devise_token_auth_for 'Account', at: 'auth'

  post "/graphql", to: "graphql#execute"
end
