require "rubygems"
require "bundler"

Bundler.setup

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

#############
# SPROCKETS #
#############

require "app_sprockets"
require "guard/sprockets2"
guard "sprockets2", sprockets: AppSprockets.environment, gz: false, digest: false do
  watch(%r{^assets/.+(\.sass|\.css|\.coffee|\.js|\.erb)$})
  watch(%r{^locales/.+(\.yml)})
end

##################
# SLIM TEMPLATES #
##################

guard "slim",
    input: "templates",
    output: "public",
    all_on_start: true,
    slim: { pretty: true } do

  watch(%r{^templates/.+(\.slim)$})
end
