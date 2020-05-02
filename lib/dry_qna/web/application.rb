require "hanami/middleware/body_parser"

module DryQna
  module Web
    def self.app
      Rack::Builder.new do
        use Hanami::Middleware::BodyParser, :json
        run DryQna::Web::Router
      end
    end
  end
end
