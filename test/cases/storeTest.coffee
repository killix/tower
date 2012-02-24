require '../config'

describe 'Tower.Store', ->
  test '.queryOperators', ->
    queryOperators =
      ">=":       "$gte"
      "$gte":     "$gte"
      ">":        "$gt"
      "$gt":      "$gt"
      "<=":       "$lte"
      "$lte":     "$lte"
      "<":        "$lt"
      "$lt":      "$lt"
      "$in":      "$in"
      "$nin":     "$nin"
      "$any":     "$any"
      "$all":     "$all"
      "=~":       "$regex"
      "$m":       "$regex"
      "$regex":   "$regex"
      "$match":   "$match"
      "$notMatch":   "$notMatch"
      "!~":       "$nm"
      "$nm":      "$nm"
      "=":        "$eq"
      "$eq":      "$eq"
      "!=":       "$neq"
      "$neq":     "$neq"
      "$null":    "$null"
      "$notNull": "$notNull"
    
    for key, value of queryOperators
      assert.equal Tower.Store.queryOperators[key], value
  
  test '.atomicModifiers', ->
    atomicModifiers =
      "$set":     "$set"
      "$unset":   "$unset"
      "$push":    "$push"
      "$pushAll": "$pushAll"
      "$pull":    "$pull"
      "$pullAll": "$pullAll"
      "$inc":     "$inc"
      "$pop":     "$pop"
    
    for key, value of atomicModifiers
      assert.equal Tower.Store.atomicModifiers[key], value
      
  test '.defaultLimit', ->
    assert.equal Tower.Store.defaultLimit, 100
    
  describe '#update', ->
    test '{ $push : { field : value }', (done) ->
      updates         = scope._store.serializeAttributesForUpdate($push: tags: ["a"])

      expect(updates).toEqual $push: tags: ["a"]

      done()

    test '{ $inc : { field : value } }'

    test '{ $set : { field : value } }'

    test '{ $unset : { field : 1} }'

    test '{ $push : { field : value } }'

    test '{ $pushAll : { field : valueArray } }'

    test '{ $addToSet : { field : value } }'

    test '{ $pop : { field : 1  } }'

    test '{ $pop : { field : -1  } }'

    test '{ $pull : { field : _value } }'

    test '{ $pullAll : { field : value_array } }'
