module Api
  module V1
    class QuotesController < ApplicationController

      respond_to :json

      def index
        quotes = Quote.select("id,author,text").all.as_json
        quotes.each do |q|
          q[:quote_url] = api_v1_quote_url(id: q["id"])
        end
        respond_with  quote_list: quotes
      end

      def show
        @quote = Quote.find(params[:id])
        respond_with @quote.attributes.merge({path: api_v1_quote_url})
      end


    end
  end
end
