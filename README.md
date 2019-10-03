# FCC Broadband Data Transformer

Inspired by [The Net Neutrality map: How I built it](https://blog.mapbox.com/the-net-neutrality-map-how-i-built-it-c387c9cb64a8)

This ruby application generates Mapbox compatible maptiles used to map FCC Broadband data  

### Dependencies

* Ruby

* Gdal (ogr2ogr): `$ brew install gdal`

* Tippecanoe, (ogr2ogr): `$ brew install tippecanoe`

### Instructions

* Clone repo

* Navigate to project folder and run `bundle install` to install the gem (ruby libraries needed to run the application)

  * If you don't have bundler, install it using `gem install bundler`

* From the command lines, run the following (in order):

  ```
  $ ruby file_manager.rb
  ```

  ```
  $ ruby geo_json_converter.rb
  ```

  ```
  $ ruby geo_json_enhancer.rb
  ```

* Navigate to the `geo_json_files` directory and run the following command to generate the maptiles

  ```
  $ tippecanoe -o ri_census_blocks.mbtiles -Z14 -z14 -ab -l --include="PROVIDERS" enhanced_tl_2019_44_tabblock10.geojson
  ```
