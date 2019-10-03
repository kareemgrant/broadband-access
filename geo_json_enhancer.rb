require 'pry'
require 'json'

provider_data_file = File.read("./blockcode_data/data.json")
geo_json_data_file = File.read("./geo_json_files/tl_2019_44_tabblock10.geojson")

provider_data = JSON.parse(provider_data_file)
geo_json_data = JSON.parse(geo_json_data_file)

geo_json_data["features"].each do |feature|
  feature_blockcode = feature["properties"]["GEOID10"]
  avg_maxaddown = provider_data[feature_blockcode]

  if  avg_maxaddown != nil
    feature["properties"]["AVGMAXADDOWN"] = avg_maxaddown.to_f
  end
end

geo_json_filename = File.basename(geo_json_data_file)

File.open("./geo_json_files/enhanced_#{geo_json_filename}.geojson", 'w') do |f|
  f.write(JSON.pretty_generate(geo_json_data))
end
