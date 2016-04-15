module.exports = (superclass) -> class MB extends superclass
  attribute2: 200
  attribute3: 300
  getValue1: -> super() + 100
  getValue2: -> super() + 100
  getValue4: -> 'MixinB'
  @getStaticValue1: -> super() + 100
  @getStaticValue2: -> super() + 100
  @getStaticValue4: -> 'MixinB'