$ = require "jquery"
L = require "leaflet-0.8-dev"
Spine = require "spine"

el = d3.select("body")
  .append "div"
  .attr id: "map"

map = L.map el[0]
