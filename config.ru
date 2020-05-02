require_relative "config/application"

DryQna::Application.finalize!

run DryQna::Web.app
