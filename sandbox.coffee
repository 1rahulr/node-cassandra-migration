#!/usr/bin/env coffee

_ = require 'lodash'
Q = require 'q'
FS = require 'fs'

#n = [1, 2, 3, 7, 8, 9,2,3,522,23,42,3,25,23,5,4,24,5,23,4,345]
n = [['four', 4], ['three', 3], ['seven', 7], ['nine', 9]]
s = _.sortBy(n, ([t,n]) -> n)

console.log s

console.log ''.split('__')

l = _([1])
.filter (v) -> isNaN(v)
.size()

console.log l

idx = require './src/index'

#idx.readConfig

config =
  migrationsDir: "test"

console.log "Config: #{config}"

console.log "Stat:", FS.statSync('sandbox.coffee')

idx.listMigrations config
.then (files) ->
  console.log "Migration files:", files
.catch (error) ->
  console.log "Error: #{error}\n#{error.stack}"

console.log "Shift empty array:", [].shift()

promiseMe = (value) ->
  d = Q.defer()
  setTimeout(-> d.resolve value, 5000)
  d.promise

Q.all [promiseMe('A'), promiseMe('B')]
.spread (a, b) ->
  console.log "a: #{a}"
  console.log "b: #{b}"
.catch (error) ->
  console.log error

