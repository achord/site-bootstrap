'use strict';

import gulp from 'gulp';

import sass from 'gulp-sass';
import cssnano from 'gulp-cssnano';
import autoprefixer from 'gulp-autoprefixer';

import babel from 'gulp-babel';
import browserify from 'browserify';

import notify from 'gulp-plumber-notifier';

import sync from 'browser-sync';
sync.create();

const jsSources = ['html/public/ui/_js/main.js'];
const styleSources = ['html/public/ui/_scss/main.scss'];
const templateSources = ['html/**/*.html', 'html/**/*.twig'];

const siteURL = 'http://bootstrap.dev';
const jsPublic = 'html/public/ui/js';
const cssPublic = 'html/public/ui/css';
const vendorPublic = 'html/public/ui/js/vendor';
const rootPublic = 'html/';

gulp.task('javascript', () => {
  gulp.src(jsSources)
    .pipe(notify())
    .pipe(babel())
    .pipe(gulp.dest(jsPublic))
    .pipe(sync.reload({ stream: true }));
});

gulp.task('javascriptBuild', () => {
  gulp.src(jsSources)
    .pipe(notify())
    .pipe(babel({
      babelrc: false,
      compact: true,
      minified: true,
      comments: false,
      presets: ['es2015']
    }))
    .pipe(gulp.dest(jsPublic))
    .pipe(sync.reload({ stream: true }));
});

gulp.task('styles', () => {
  gulp.src(styleSources)
    .pipe(notify())
    .pipe(sass({
      errLogToConsole: true,
      sourceComments: 'normal'
    }))
    .pipe(autoprefixer())
    .pipe(gulp.dest(cssPublic))
    .pipe(sync.reload({ stream: true }));
});

gulp.task('stylesBuild', () => {
  gulp.src(styleSources)
    .pipe(sass())
    .pipe(autoprefixer())
    .pipe(cssnano())
    .pipe(gulp.dest(cssPublic))
    .pipe(sync.reload({ stream: true }));
});

gulp.task('html', () => {
  gulp.src(templateSources)
    .pipe(sync.reload({ stream: true }));
});

gulp.task('sync', () => {
  sync.init({
    proxy: siteURL,
    injectChanges: true
  });
});

gulp.task('start-styleguide', () => {
  notify();
  styleguide.startServer({
    styleguidePath: 'html/styleguide'
  });
});

gulp.task('watch', () => {
  gulp.watch('html/public/ui/_js/**/*.js', ['javascript']);
  gulp.watch('html/**/*.scss', ['styles']);
  gulp.watch(templateSources, ['html']);
});

gulp.task('default', ['javascript', 'styles', 'html', 'watch', 'sync']);

gulp.task('build', ['javascriptBuild', 'stylesBuild']);
