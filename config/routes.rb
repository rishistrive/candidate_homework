Rails.application.routes.draw do
  mount API::Integrations => '/'
end
