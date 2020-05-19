class HarryService
  def house_members(house)
    houses.find {|h| h[:name] == house}[:members]
  end

  def houses 
    hittus_apius("houses")
  end
  
  def characters
    hittus_apius("characters")
  end

  def phoenix_members
    characters.find_all {|character| character[:orderOfThePhoenix]}
  end

  def phoenix_house_members(house)
    characters.select do |character| 
      character[:house] == house && character[:orderOfThePhoenix]
    end
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