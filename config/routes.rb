Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  # GraphQL で認証するのでコメントアウト
  # mount_devise_token_auth_for 'Account', at: 'auth'
end
