'use strict'

gulp         = require 'gulp'
coffee       = require 'gulp-coffee'
sass         = require 'gulp-sass'
autoprefixer = require 'gulp-autoprefixer'
browserify   = require 'gulp-browserify'
concat       = require 'gulp-concat'
sync         = require('browser-sync').create()


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

gulp.task 'styles', ->
    gulp.src styleSources
        .pipe sass({errLogToConsole: true, sourceComments : 'normal'})
        .on 'error', errorLog
        .pipe autoprefixer()
        .on 'error', errorLog
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

gulp.task 'default', ['coffee', 'styles', 'html', 'sync', 'watch']

# EOF
