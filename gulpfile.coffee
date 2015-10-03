'use strict'

autoprefixer = require 'gulp-autoprefixer'
browserify   = require 'gulp-browserify'
coffee       = require 'gulp-coffee'
concat       = require 'gulp-concat'
gulp         = require 'gulp'
minify       = require 'gulp-minify-css'
sass         = require 'gulp-sass'
sync         = require('browser-sync').create()
uglify       = require 'gulp-uglify'


coffeeSources = [
    'html/public/ui/_js/main.coffee'
]
styleSources = [
    'html/public/ui/_scss/main.scss'
]
templateSources = [
    'html/**/*.html'
]

siteURL     = 'http://bootstrap.dev'
jsPublic     = 'html/public/ui/js'
cssPublic    = 'html/public/ui/css'
vendorPublic = 'html/public/ui/js/vendor'
rootPublic   = 'html/'

errorLog = (error) ->
    console.error error.stack

gulp.task 'coffee', ->
    gulp.src coffeeSources, read: false
        .pipe browserify({transform: ['coffeeify'],extensions: ['.coffee']})
        .on 'error', errorLog
        .pipe concat 'main.js'
        .pipe gulp.dest jsPublic
        .pipe sync.reload stream:true
    return

gulp.task 'coffeeBuild', ->
    gulp.src coffeeSources, read: false
        .pipe browserify({transform: ['coffeeify'],extensions: ['.coffee']})
        .on 'error', errorLog
        .pipe uglify()
        .pipe concat 'main.js'
        .pipe gulp.dest jsPublic
        .pipe sync.reload stream:true
    return

gulp.task 'styles', ->
    gulp.src styleSources
        .pipe sass({errLogToConsole: true, sourceComments : 'normal'})
        .on 'error', errorLog
        .pipe autoprefixer()
        .on 'error', errorLog
        .pipe gulp.dest cssPublic
        .pipe sync.reload stream:true
    return

gulp.task 'stylesBuild', ->
    gulp.src styleSources
        .pipe sass()
        .on 'error', errorLog
        .pipe autoprefixer()
        .on 'error', errorLog
        .pipe minify()
        .pipe gulp.dest cssPublic
        .pipe sync.reload stream:true
    return

gulp.task 'html', ->
    gulp.src templateSources
        .pipe sync.reload stream:true
    return

gulp.task 'sync', ->
    sync.init proxy: siteURL
    return

gulp.task 'watch', ->
    gulp.watch 'html/**/*.coffee', ['coffee']
    gulp.watch 'html/**/*.scss', ['styles']
    gulp.watch templateSources, ['html']
    return

# gulp = require('./gulp')(
#     'compass',
#     'browserify',
#     'watch',
#     'browser-sync'
# )
gulp.task 'default', ['coffee', 'styles', 'html', 'sync', 'watch']
gulp.task 'build', ['coffeeBuild', 'stylesBuild', 'html', 'sync', 'watch']

# EOF
