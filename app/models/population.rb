class Population
  def initialize(params={})
    @key  = params[:key]
    @year = params[:year]
  end

  def url
    "http://api.census.gov/data/#{@year}/?key=#{@key}"
  end


end
