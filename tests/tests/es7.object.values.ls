{module, test} = QUnit
module \ES7

test 'Object.values' (assert)!->
  {values, create, assign} = Object
  assert.isFunction values
  assert.arity values, 1
  assert.name values, \values
  assert.looksNative values
  assert.nonEnumerable Object, \values
  assert.deepEqual values({q:1, w:2, e:3}), [1 2 3]
  assert.deepEqual values(new String \qwe), [\q \w \e]
  assert.deepEqual values(assign create({q:1, w:2, e:3}), {a:4, s:5, d:6}), [4 5 6]
  assert.deepEqual values({ valueOf: 42 }), [42], 'IE enum keys bug'
  try assert.deepEqual Function('return Object.values({a: 1, get b(){delete this.c;return 2},c: 3})')!, [1 2]
  try assert.deepEqual Function('return Object.values({a: 1, get b(){Object.defineProperty(this, "c", {value:4,enumerable:false});return 2},c: 3})')!, [1 2]