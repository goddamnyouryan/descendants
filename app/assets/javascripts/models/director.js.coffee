class Descendants.Models.Director extends Backbone.AssociatedModel
  idAttribute: 'slug'
  urlRoot: '/api/directors'

  relations: [
    type: Backbone.Many
    key: 'videos'
    relatedModel: 'Descendants.Models.Video'
  ,
    type: Backbone.One
    key: 'featured'
    relatedModel: 'Descendants.Models.Video'
  ]
