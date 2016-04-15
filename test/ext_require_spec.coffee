expect = require('chai').expect

describe 'ext', ->

  it 'should work without any mixin', ->
    T = require('./fixtures/cls_plain')
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
    T = require('./fixtures/cls_with_a')
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
    T = require('./fixtures/cls_with_b')
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
    T = require('./fixtures/cls_with_b')
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
    T = require('./fixtures/cls_with_a_b')
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
    T = require('./fixtures/cls_with_b_a')
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

