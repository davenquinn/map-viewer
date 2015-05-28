$ = require "jquery"
L = require "leaflet-0.8-dev"
Spine = require "spine"

node = document.createElement 'div'
document.body.appendChild node

map = new L.Map node,
  center: [34.05, -118.25]
  zoom: 6

url = 'http://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}'
if L.Browser.retina
  url += "@2x"
url += ".png"

attr = '© <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors,
        © <a href="http://cartodb.com/attributions">CartoDB</a>'

layer = L.tileLayer url,
  attribution: attr

layer.addTo map
