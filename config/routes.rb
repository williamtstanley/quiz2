Rails.application.routes.draw do

    root "support_tickets#index"

    resources :support_tickets
    get "/support_tickets/search" => "support_tickets#search"
    post "/support_tickets/search" => "support_tickets#search", as: :search
    get "/support_tickets/search/:page" => "support_tickets#search", as: :page

#             Prefix Verb   URI Pattern                        Controller#Action
#     supporttickets GET    /support_tickets(.:format)          supporttickets#index
#                    POST   /support_tickets(.:format)          supporttickets#create
#  new_supportticket GET    /support_tickets/new(.:format)      supporttickets#new
# edit_supportticket GET    /support_tickets/:id/edit(.:format) supporttickets#edit
#      supportticket GET    /support_tickets/:id(.:format)      supporttickets#show
#                    PATCH  /support_tickets/:id(.:format)      supporttickets#update
#                    PUT    /support_tickets/:id(.:format)      supporttickets#update
#                    DELETE /support_tickets/:id(.:format)      supporttickets#destroy

end
