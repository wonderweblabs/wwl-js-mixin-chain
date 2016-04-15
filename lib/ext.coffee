_ = require('underscore')

module.exports = (superClass) ->
  superClass: superClass
  with: (mixins...) ->
    mixins = mixins || []
    mixins = [] unless _.isArray(mixins)
    return superClass unless _.any(mixins)

    resultClass = superClass

    _.each mixins, (mixin) ->
      r = mixin(resultClass)

      resultClass = r if _.isFunction(r)

    resultClass