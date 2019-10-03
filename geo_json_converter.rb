require 'pry'

file_path = "./smaller_shps/*.shp"

files = Dir[file_path]

files.each do |file|
  geo_json_filename = File.basename(file).gsub('.shp', '.geojson')
  system "sudo ogr2ogr -f GeoJSON './geo_json_files/#{geo_json_filename}' '#{file}'"
end
