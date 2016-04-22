Translate::Engine.routes.draw do
  get '' => 'translate#index', :as => :translate_list
  post '' => 'translate#translate_action', :as => :translate_action
  get 'reload' => 'translate#reload', :as => :reload
end