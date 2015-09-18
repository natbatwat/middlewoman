#Work in progress.

The purpose of this boilerplate is to be a **_one-click static generator_** using a combination of __Middleman/Rack__ build with direct Heroku deployment. It places emphasis on __front-end testing__, __performance optimization__ and being __lightweight__.

##Features
- One-step deployment to Heroku
- Basic SEO infrastructure
- Image optimization
- LiveReload
- Gzip compression
- 404 page
- Build minification of CSS/ JS
- Modular Front-end folder architecture
- Normalize.css
- Modernizer.js
- Front-end testing (W.I.P)

##What this does NOT include
- Bootstrap
- HAML/ SLIM

##Dependencies

##Pre-requisites 
- Heroku Toolbelt

##Directions
- run `bundle install` (try `bundle update` instead if there are gem version conflicts)
- run `middleman build` (note: the build folder is in `.gitignore` and not pushed)