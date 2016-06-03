L = require "leaflet-0.8-dev"
Projection = require "./projection"

module.exports = (node)->
  new L.Map node,
    center: [-24.3,16.62]
    zoom: 11
    minZoom: 11
    crs: Projection
