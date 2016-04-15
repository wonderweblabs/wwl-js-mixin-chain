expect = require('chai').expect

class SuperClass
  attribute1: 1
  attribute2: 2
  attribute3: 3
  getValue1: -> 1
  getValue2: -> 2
  getValue3: -> 3
  getValue4: -> 4
  @getStaticValue1: -> 1
  @getStaticValue2: -> 2
  @getStaticValue3: -> 3
  @getStaticValue4: -> 4

MixinA = (superclass) -> class MA extends superclass
  attribute1: 10
  attribute3: 30
  getValue1: -> super() + 10
  getValue4: -> 'MixinA'
  @getStaticValue1: -> super() + 10
  @getStaticValue4: -> 'MixinA'

MixinB = (superclass) -> class MB extends superclass
  attribute2: 200
  attribute3: 300
  getValue1: -> super() + 100
  getValue2: -> super() + 100
  getValue4: -> 'MixinB'
  @getStaticValue1: -> super() + 100
  @getStaticValue2: -> super() + 100
  @getStaticValue4: -> 'MixinB'


describe 'ext', ->

  ext = require('../lib/ext')

  it 'should work without any mixin', ->
    class T extends ext(SuperClass).with()
    t = new T()

    expect(t.attribute1).to.eql(1)
    expect(t.attribute2).to.eql(2)
    expect(t.attribute3).to.eql(3)
    expect(t.getValue1()).to.eql(1)
    expect(t.getValue2()).to.eql(2)
    expect(t.getValue3()).to.eql(3)
    expect(t.getValue4()).to.eql(4)
    expect(T.getStaticValue1()).to.eql(1)
    expect(T.getStaticValue2()).to.eql(2)
    expect(T.getStaticValue3()).to.eql(3)
    expect(T.getStaticValue4()).to.eql(4)

  it 'should modify values when using MixinA', ->
    class T extends ext(SuperClass).with(MixinA)
    t = new T()

    expect(t.attribute1).to.eql(10)
    expect(t.attribute2).to.eql(2)
    expect(t.attribute3).to.eql(30)
    expect(t.getValue1()).to.eql(11)
    expect(t.getValue2()).to.eql(2)
    expect(t.getValue3()).to.eql(3)
    expect(t.getValue4()).to.eql('MixinA')
    expect(T.getStaticValue1()).to.eql(11)
    expect(T.getStaticValue2()).to.eql(2)
    expect(T.getStaticValue3()).to.eql(3)
    expect(T.getStaticValue4()).to.eql('MixinA')

  it 'should modify values when using MixinB', ->
    class T extends ext(SuperClass).with(MixinB)
    t = new T()

    expect(t.attribute1).to.eql(1)
    expect(t.attribute2).to.eql(200)
    expect(t.attribute3).to.eql(300)
    expect(t.getValue1()).to.eql(101)
    expect(t.getValue2()).to.eql(102)
    expect(t.getValue3()).to.eql(3)
    expect(t.getValue4()).to.eql('MixinB')
    expect(T.getStaticValue1()).to.eql(101)
    expect(T.getStaticValue2()).to.eql(102)
    expect(T.getStaticValue3()).to.eql(3)
    expect(T.getStaticValue4()).to.eql('MixinB')

  it 'should modify values when using MixinB a second time', ->
    class T extends ext(SuperClass).with(MixinB)
    t = new T()

    expect(t.attribute1).to.eql(1)
    expect(t.attribute2).to.eql(200)
    expect(t.attribute3).to.eql(300)
    expect(t.getValue1()).to.eql(101)
    expect(t.getValue2()).to.eql(102)
    expect(t.getValue3()).to.eql(3)
    expect(t.getValue4()).to.eql('MixinB')
    expect(T.getStaticValue1()).to.eql(101)
    expect(T.getStaticValue2()).to.eql(102)
    expect(T.getStaticValue3()).to.eql(3)
    expect(T.getStaticValue4()).to.eql('MixinB')

  it 'should modify values when using MixinA,MixinB', ->
    class T extends ext(SuperClass).with(MixinA, MixinB)
    t = new T()

    expect(t.attribute1).to.eql(10)
    expect(t.attribute2).to.eql(200)
    expect(t.attribute3).to.eql(300)
    expect(t.getValue1()).to.eql(111)
    expect(t.getValue2()).to.eql(102)
    expect(t.getValue3()).to.eql(3)
    expect(t.getValue4()).to.eql('MixinB')
    expect(T.getStaticValue1()).to.eql(111)
    expect(T.getStaticValue2()).to.eql(102)
    expect(T.getStaticValue3()).to.eql(3)
    expect(T.getStaticValue4()).to.eql('MixinB')

  it 'should modify values when using MixinB,MixinA', ->
    class T extends ext(SuperClass).with(MixinB, MixinA)
    t = new T()

    expect(t.attribute1).to.eql(10)
    expect(t.attribute2).to.eql(200)
    expect(t.attribute3).to.eql(30)
    expect(t.getValue1()).to.eql(111)
    expect(t.getValue2()).to.eql(102)
    expect(t.getValue3()).to.eql(3)
    expect(t.getValue4()).to.eql('MixinA')
    expect(T.getStaticValue1()).to.eql(111)
    expect(T.getStaticValue2()).to.eql(102)
    expect(T.getStaticValue3()).to.eql(3)
    expect(T.getStaticValue4()).to.eql('MixinA')

