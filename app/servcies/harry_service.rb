class HarryService
  def house_members(house)
    houses = hittus_apius("houses")
    houses.find {|h| h[:name] == house}[:members]
  end

  def houses 
    hittus_apius("houses")
  end

private
  def conn
    Faraday.new(url: 'https://www.potterapi.com/v1') do |f|
      f.adapter Faraday.default_adapter
      f.params[:key] = ENV["HP_API_KEY"]
    end
  end

  def hittus_apius(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end
end