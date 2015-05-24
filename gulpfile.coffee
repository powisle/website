gulp        = require 'gulp'
mocha       = require 'gulp-mocha'
coffee      = require 'gulp-coffee'
sourcemaps  = require 'gulp-sourcemaps'
source      = require 'vinyl-source-stream'
through     = require 'through2'
del         = require 'del'
buffer      = require 'vinyl-buffer'
rename      = require "gulp-rename"
webserver   = require 'gulp-webserver'
bower       = require 'gulp-bower'
notify      = require 'gulp-notify'
browserify  = require 'browserify'
coffeeify   = require 'coffeeify'

{ fork }    = require 'child_process'

gulp.task 'clean', (done) ->
  del 'build/**/*', done

gulp.task 'bower', ->
  bower()
    .pipe gulp.dest 'build/'

gulp.task 'assets', ->
  gulp
    .src 'assets/**/*'
    .pipe gulp.dest 'build/'

gulp.task 'browserify', ->
  b = browserify
    entries: 'scripts/index.coffee'
    debug: true
    transform: coffeeify
    extensions: ['.coffee']

  return b.bundle()
    .pipe source 'bundle.js'
    .pipe buffer()
    .pipe gulp.dest 'build/js'

gulp.task 'teacup', ->
  gulp
    .src 'html/**/*.coffee', read: no
    .pipe through.obj (file, enc, done) ->
      # each file should be a module containing Teacup View instance
      # i.e. a function, that when called returns HTML string
      require.cache[file.path] = null # Clear cache, otherwise watch will always produce same output
      try
        view = require file.path
        html = do view
      catch error
        console.error error
        return @emit 'error', error

      file.contents = new Buffer html
      @push file
      do done
    .on 'error', notify.onError (error) -> "Error: #{error.message}"

    .pipe rename extname: '.html'
    .pipe gulp.dest 'build/'

gulp.task 'coffee', ->
  development = process.env.NODE_ENV is 'development'

  gulp
    .src 'src/**/*.coffee'
    .pipe sourcemaps.init()
    .pipe coffee()
    # Only write source maps if env is development. Otherwise just pass thgrough.
    .pipe if development then sourcemaps.write 'sources/' else through.obj()
    .pipe gulp.dest 'build/'

gulp.task 'test', ->
  development = process.env.NODE_ENV is 'development'

  gulp
    .src 'test/*.coffee', read: no
    .pipe mocha
      reporter  : 'list'
      compilers : 'coffee:coffee-script'
    .once 'error', (error) ->
      console.error 'Tests failed'
      console.error error.stack
      if development
        return @emit 'end'
      else
        process.exit 1

gulp.task 'build', gulp.series [
  'clean'
  'bower'
  'assets'
  'teacup'
  'browserify'
  'test'
]

server = null
gulp.task 'start', (done) ->
  server = fork __dirname
  do done

gulp.task 'stop', (done) ->
  if not server then return do done

  server.kill 'SIGINT'
  do done

gulp.task 'watch', (done) ->
  gulp.watch [
    'test/**/*'
    'package.json'
  ], gulp.series [
    'test'
  ]

  gulp.watch ['src/**/*.coffee'], gulp.series [ 'coffee' ]
  gulp.watch ['scripts/**/*'], gulp.series [ 'browserify' ]
  gulp.watch ['html/**/*'], gulp.series [ 'teacup' ]
  gulp.watch ['assets/**/*'], gulp.series [ 'assets' ]

gulp.task 'serve', ->
  gulp
    .src 'build/'
    .pipe webserver
      livereload: yes
      open      : yes
      port      : 8080

gulp.task 'develop', gulp.series [
  (done) ->
    process.env.NODE_ENV ?= 'development'
    do done
  'build'
  'serve'
  'watch'
]
