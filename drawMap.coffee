
tile2long = (x,z) ->
  (x / Math.pow(2,z) * 360 -180)

tile2lat = (y,z) ->
  n = Math.PI - ((2 * Math.PI * y) / Math.pow(2,z))
  180 / Math.PI * Math.atan(0.5*(Math.exp(n)-Math.exp(-n)))

google.maps.event.addDomListener window, "load", () ->
  region = "Z18X44809Y104727"
  parts = region.split 'X'
  zoom = parts[0].slice 1,3
  coords = parts[1].split 'Y'
  xTile = coords[0]
  yTile = coords[1]

  map = new google.maps.Map document.getElementById "map_div", {
    center: new google.maps.LatLng(tile2lat(yTile,zoom), tile2long(xTile,zoom))
    zoom:zoom
    mapTypeId: google.maps.MapTypeId.RODADMAP
  }