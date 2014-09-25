require 'api/v1/quote'

module Api
  module V1
    class QuotesController < ApplicationController

      respond_to :json

      def index
        @quotes = select_filtered_quotes.as_json
        add_links_to_quotes
        respond_with  quote_list: @quotes
      end

      def show
        @quote = Quote.find(params[:id])
        respond_with @quote.attributes.merge({path: api_v1_quote_path})
      end

      private

      def select_filtered_quotes
        fields = "quotes.id, quotes.author, quotes.text"
        if params[:tag]
          quotes = Quote.select(fields).tagged_with(params[:tag])
        else
          quotes = Quote.select(fields).all
        end
        quotes
      end

      def add_links_to_quotes
        @quotes.each do |q|
          q[:path] = api_v1_quote_path(id: q["id"])
        end
      end

    end
  end
end
