TwitterFeed::Application.routes.draw do
  root 'users#search'
  get '/users/tweets', to: 'users#tweets'
end
