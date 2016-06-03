L = require "leaflet-0.8-dev"
proj4 = require "proj4"

s = '+proj=utm +zone=33 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs'
m = 'EPSG:4326'

min_res = 160000
n_res = 21
res = (min_res/Math.pow(2,i) for i in [0...n_res])
console.log res
console.log res.length

projection = proj4 m,s
bbox = [[10,-30],[20,-20]]
_bounds = bbox
  .map projection.forward
  .map (d)-> L.point d[0], d[1]
bounds = L.bounds _bounds

Projection =
  bounds: bounds
  project: (ll)->
    out = projection.forward [ll.lng,ll.lat]
    new L.Point out[0],out[1]
  unproject: (pt)->
    out = projection.inverse [pt.x,pt.y]
    new L.LatLng out[1], out[0]

module.exports = L.extend {}, L.CRS.Earth,
  code: 'EPSG:32733'
  projection: Projection
  transformation: new L.Transformation 1, -bounds.min.x, -1, bounds.max.y
  scale: (zoom)-> 1/res[zoom]
  wrapLng: null
  resolutions: res
