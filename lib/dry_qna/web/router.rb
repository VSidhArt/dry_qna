module DryQna
  module Web
    Router = Hanami::Router.new do
      post "/questions", to: Controllers::Questions::Create
    end
  end
end
