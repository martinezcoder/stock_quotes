class QuotesController < ApplicationController
  def index
    if params[:tag]
      @quotes = Quote.tagged_with(params[:tag])
    else
      @quotes = Quote.all
    end
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
    @quote = Quote.find(params[:id])
  end

  def create
    @quote = Quote.new(params[:quote])

    if @quote.save
      redirect_to @quote, notice: 'Quote was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @quote = Quote.find(params[:id])

    if @quote.update_attributes(params[:quote])
      redirect_to @quote, notice: 'Quote was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy

    redirect_to quotes_url
  end
end
