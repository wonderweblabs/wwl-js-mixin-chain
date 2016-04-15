# WWL JS Mixin Chain

| Master | Develop |
|--------|---------|
| [![Build Status](https://travis-ci.org/wonderweblabs/wwl-js-mixin-chain.svg?branch=master)](https://travis-ci.org/wonderweblabs/wwl-js-mixin-chain) | [![Build Status](https://travis-ci.org/wonderweblabs/wwl-js-mixin-chain.svg?branch=develop)](https://travis-ci.org/wonderweblabs/wwl-js-mixin-chain) |

---

The mixin chain allows to include prototypes with an undefined parent class into your classes structure.

So you can append prototypes with mixin like code by using the `ext` function of the mixin chain.

Mixin prototypes needs to be encapsuled inside a function getting the super class as parameter.




## Example

Let's assume, we've got the following super class:

```coffeescript

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

```

And then, we implemented the following mixins which are overwriting some attributes, instance functions and class functions:

```coffeescript

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

```


#### Inherit `SuperClass` only

```coffeescript
ext = require('../lib/ext')

class T extends ext(SuperClass).with()
t = new T()

t.attribute1          # 1
t.attribute2          # 2
t.attribute3          # 3
t.getValue1()         # 1
t.getValue2()         # 2
t.getValue3()         # 3
t.getValue4()         # 4
T.getStaticValue1()   # 1
T.getStaticValue2()   # 2
T.getStaticValue3()   # 3
T.getStaticValue4()   # 4
```


#### Inherit `SuperClass` with `MixinA`

```coffeescript
ext = require('../lib/ext')

class T extends ext(SuperClass).with(MixinA)
t = new T()

t.attribute1          # 10
t.attribute2          # 2
t.attribute3          # 30
t.getValue1()         # 11
t.getValue2()         # 2
t.getValue3()         # 3
t.getValue4()         # 'MixinA'
T.getStaticValue1()   # 11
T.getStaticValue2()   # 2
T.getStaticValue3()   # 3
T.getStaticValue4()   # 'MixinA'
```


#### Inherit `SuperClass` with `MixinB`

```coffeescript
ext = require('../lib/ext')

class T extends ext(SuperClass).with(MixinB)
t = new T()

t.attribute1          # 1
t.attribute2          # 200
t.attribute3          # 300
t.getValue1()         # 101
t.getValue2()         # 102
t.getValue3()         # 3
t.getValue4()         # 'MixinB'
T.getStaticValue1()   # 101
T.getStaticValue2()   # 102
T.getStaticValue3()   # 3
T.getStaticValue4()   # 'MixinB'
```


#### Inherit `SuperClass` with `MixinA` and `MixinB`

```coffeescript
ext = require('../lib/ext')

class T extends ext(SuperClass).with(MixinA, MixinB)
t = new T()

t.attribute1          # 10
t.attribute2          # 200
t.attribute3          # 300
t.getValue1()         # 111
t.getValue2()         # 102
t.getValue3()         # 3
t.getValue4()         # 'MixinB'
T.getStaticValue1()   # 111
T.getStaticValue2()   # 102
T.getStaticValue3()   # 3
T.getStaticValue4()   # 'MixinB'
```


#### Inherit `SuperClass` with `MixinB` and `MixinA`

```coffeescript
ext = require('../lib/ext')

class T extends ext(SuperClass).with(MixinB, MixinA)
t = new T()

t.attribute1          # 10
t.attribute2          # 200
t.attribute3          # 30
t.getValue1()         # 111
t.getValue2()         # 102
t.getValue3()         # 3
t.getValue4()         # 'MixinA'
T.getStaticValue1()   # 111
T.getStaticValue2()   # 102
T.getStaticValue3()   # 3
T.getStaticValue4()   # 'MixinA'
```


