$ = require "jquery"
L = require "leaflet-0.8-dev"
Spine = require "spine"

node = document.createElement 'div'
document.body.appendChild node

map = new L.Map node,
  center: [34.05, -118.25]
  zoom: 6

layer = L.tileLayer 'http://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png',
  attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, &copy; <a href="http://cartodb.com/attributions">CartoDB</a>'

layer.addTo map
