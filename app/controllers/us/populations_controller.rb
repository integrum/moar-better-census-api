class US::PopulationsController < ApplicationController
  respond_to :json

  before_filter :setup_population

  def show
    respond_with @population
  end


  protected
  def setup_population
    @population = Population.new :key => api_key, :year => 2010
  end

end
