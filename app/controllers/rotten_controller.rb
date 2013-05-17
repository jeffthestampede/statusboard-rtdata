class RottenController < ApplicationController
  require 'open-uri'
  require 'net/http'

  respond_to :json

  def data
    @datapts = []
    url = open("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=8ty2r2nhkhkhuvzyn6m29ccb&limit=10")
    result = (JSON.load(url.read)).first
    @data = result[1]

    @data.each do |f|
      @datapts << {"title" => "#{f["title"]}", "value" => "#{f["ratings"]["audience_score"]}"}
    end

    @data = result[0]
    @output = {"graph" =>
                {
                  "title" => "Ratings of Top 10 Movies This Week",
                  "datasequences" => [
                    {
                      "title" => "Movies",
                    "datapoints" => @datapts
                    }
                  ]
                 }
                }
      render :json => @output
  end
end
