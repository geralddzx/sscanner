class CompaniesController < ApplicationController
	def autocomplete
	  @query = params[:query].upcase.strip
	  @company_search = Company.where(ticker: /#{@query}/i)
	  respond_to do |format|
	    format.json { render json: @company_search, :only => [:ticker, :id] }
	  end
	end
end
