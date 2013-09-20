require "sprockets"

class AppSprockets
  def self.environment
    sprockets = Sprockets::Environment.new
    sprockets.context_class.class_eval do
      include Helpers
    end
    sprockets.append_path "assets/javascripts"
    sprockets.append_path "assets/stylesheets"
    sprockets.append_path "assets/images"
    sprockets
  end

  module Helpers
  end
end
