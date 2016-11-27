#lang racket

(display
  (string-append "Listening on localhost:" (number->string 8080)))

(require (planet dmac/spin))

(require web-server/templates)

(get "/hi/:name" (lambda (req)
  (string-append "Hello, " (params req 'name) "!")))

(get "/template/:name" (lambda (req)
  (define name (params req 'name))
  (include-template "index.html")))

(run)

