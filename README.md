#Middlewoman


###Another Middleman Template?!
The purpose of this boilerplate is to be a static Rack-based generator for easy Heroku deployment that functions on the lowest-common-denominator: no SLIM, no HAML, no Coffeescript, no Bootstrap. 

Straight-forward modular stylesheet folder structure with built-in SEO, image-optimization, file compression, [sass-mq](https://github.com/sass-mq/sass-mq), and LiveReload. Set-up and start coding.

###This template could be great for you if:
1. Your project is primarily static, front-end focused 
2. You deploy to Heroku
3. You want a basic SEO set-up and performance optimization
4. You use sass-mq <https://github.com/sass-mq/sass-mq>

##Features
- Basic SEO infrastructure (meta-tags, browser-specific)
- .env file to store environmental variables for all stages of development
- Image optimization
- LiveReload during development
- Gzip compression
- 404 page
- Automated sitemap and robots.txt generator
- Build minification of CSS/ JS/ HTML
- Normalize.css
- Modernizer.js

##Directions
- run `bundle install` (try `bundle update` instead if there are gem version conflicts)
- run `middleman build` (note: the build folder is in `.gitignore` and not pushed)

##TO DO
- Front-end testing
