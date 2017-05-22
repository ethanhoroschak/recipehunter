require 'httparty'

class Recipe < ActiveRecord::Base
	include HTTParty
	default_options.update(verify: false)

	key_value = ENV['FOOD2FORK_KEY'] || "d5f20b934856d621b67acf4a4f537438"
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
	base_uri "http://#{hostport}/api"
	default_params key: key_value
	format :json

	def self.for search_term
		get("/search", query: {q:search_term})["recipes"]
	end

end
