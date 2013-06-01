class Population
  def initialize(params={})
    @key  = params[:key]
    @year = params[:year]
    @get  = params[:get] || 'P0010001,NAME'
    @for  = params[:for] || 'state:*'
  end

  def url
    "http://api.census.gov/data/#{@year}/sf1?key=#{@key}&get=#{@get}&for=#{@for}"
  end


end
