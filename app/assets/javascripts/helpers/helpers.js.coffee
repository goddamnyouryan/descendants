Descendants.Helpers =
  renderPartial: ( path, options = {} ) ->
    path = path.split('/')
    path[ path.length - 1 ] = '_' + path[ path.length - 1 ]
    path = path.join('/')
    try
      JST["partials/#{ path }"]( options )
    catch error
      "Sorry, there is no partial named '#{ path }'"
