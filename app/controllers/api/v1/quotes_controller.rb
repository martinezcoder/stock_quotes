module Api
  module V1
    class QuotesController < ApplicationController
      class Quote < ::Quote
        def as_json(options = {})
          super.merge({created_on: created_at.to_datetime,
                       updated_on: updated_at.to_datetime})
        end
      end

      respond_to :json

      def index
        if params[:tag]
          @quotes = Quote.tagged_with(params[:tag])
        else
          @quotes = Quote.all
        end
        respond_with @quotes
      end

      def show
        respond_with Quote.find(params[:id])
      end

    end
  end
end
