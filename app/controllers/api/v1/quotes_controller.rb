module Api
  module V1
    class QuotesController < ApplicationController

      respond_to :json

      def index
        fields = "id, author, text"
        if params[:tag]
          quotes = Quote.select(fields).tagged_with(params[:tag])
        else
          quotes = Quote.select(fields).all
        end

        quotes = quotes.as_json
        quotes.each do |q|
          q[:path] = api_v1_quote_path(id: q["id"])
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
