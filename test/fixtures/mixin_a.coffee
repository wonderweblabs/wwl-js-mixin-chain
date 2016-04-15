module.exports = (superclass) -> class MA extends superclass
  attribute1: 10
  attribute3: 30
  getValue1: -> super() + 10
  getValue4: -> 'MixinA'
  @getStaticValue1: -> super() + 10
  @getStaticValue4: -> 'MixinA'