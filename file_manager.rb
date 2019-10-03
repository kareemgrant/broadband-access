require 'pry'

file_path = "./block_shapefiles/**/*.shp"

files = Dir[file_path]

files.each do |file|
  system "sudo ogr2ogr -f 'ESRI Shapefile' -simplify 0.00005 './smaller_shps/#{File.basename(file)}' '#{file}'"
end
