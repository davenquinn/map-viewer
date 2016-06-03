L = require "leaflet-0.8-dev"
require "./dev"
key = require "keymaster"
createMap = require "./map"
$ = require "jquery"

reload = ->
  console.log 'Reloading app...'
  # Clear and delete node-webkit's global required modules cache.
  # See: http://stackoverflow.com/q/25143532/
  for module_name, module of global.require.cache
    delete global.require.cache[module_name]
  window.location.reload()

key "ctrl+D",->
  window.require('nw.gui').Window.get().showDevTools()
key "ctrl+R",reload

node = document.createElement 'div'
document.body.appendChild node

map = createMap node

url = "http://localhost:8080/wmts"

contours = L.tileLayer url+'/contour_hq/utm_hq/{z}/{x}/{y}.png',
  minZoom: 1
  maxZoom: 20
  tileSize: 256
  continuousWorld: true
  #detectRetina: true

satellite = L.tileLayer url+'/satellite/utm/{z}/{x}/{y}.png',
  minZoom: 1
  maxZoom: 20
  tileSize: 256
  detectRetina: true

contours.addTo map
satellite.addTo map
