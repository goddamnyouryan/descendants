class Descendants.Views.Map extends Backbone.View

  locations:
    {
      la: [34.092011, -118.338733]
      toronto: [43.643995, -79.396577]
    }

  initialize: ->
    @drawMaps()

  drawMaps: ->
    _.each ['la', 'toronto'], (location) =>
      mapElement = document.getElementById(location)
      latLng = @latLng(@locations[location][0], @locations[location][1])
      map = @map mapElement, latLng
      @marker map, latLng

  map: (element, latLng) ->
    new google.maps.Map element, @mapOptions(latLng)

  marker: (map, latLng) ->
    new google.maps.Marker
      icon: ''
      position: latLng
      map: map

  latLng: (lat, lng) ->
    new google.maps.LatLng(lat, lng)

  mapOptions: (latlng) ->
    center: latlng
    zoom: 14
    zoomControl: true
    zoomControlOptions:
      style: google.maps.ZoomControlStyle.DEFAULT

    disableDoubleClickZoom: true
    mapTypeControl: true
    mapTypeControlOptions:
      style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR

    scaleControl: true
    scrollwheel: true
    streetViewControl: true
    draggable: true
    overviewMapControl: true
    overviewMapControlOptions:
      opened: false

    mapTypeId: google.maps.MapTypeId.ROADMAP
    styles: [
      {
        featureType: "landscape"
        stylers: [
          {
            saturation: -100
          }
          {
            lightness: 65
          }
          {
            visibility: "on"
          }
        ]
      }
      {
        featureType: "poi"
        stylers: [
          {
            saturation: -100
          }
          {
            lightness: 51
          }
          {
            visibility: "simplified"
          }
        ]
      }
      {
        featureType: "road.highway"
        stylers: [
          {
            saturation: -100
          }
          {
            visibility: "simplified"
          }
        ]
      }
      {
        featureType: "road.arterial"
        stylers: [
          {
            saturation: -100
          }
          {
            lightness: 30
          }
          {
            visibility: "on"
          }
        ]
      }
      {
        featureType: "road.local"
        stylers: [
          {
            saturation: -100
          }
          {
            lightness: 40
          }
          {
            visibility: "on"
          }
        ]
      }
      {
        featureType: "transit"
        stylers: [
          {
            saturation: -100
          }
          {
            visibility: "simplified"
          }
        ]
      }
      {
        featureType: "administrative.province"
        stylers: [visibility: "off"]
      }
      {
        featureType: "water"
        elementType: "labels"
        stylers: [
          {
            visibility: "on"
          }
          {
            lightness: -25
          }
          {
            saturation: -100
          }
        ]
      }
      {
        featureType: "water"
        elementType: "geometry"
        stylers: [
          {
            hue: "#ffff00"
          }
          {
            lightness: -25
          }
          {
            saturation: -97
          }
        ]
      }
    ]
