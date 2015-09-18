#Middlewoman


###Another Middleman Template?!
> The purpose of this boilerplate is to be a static Rack-based generator for easy Heroku deployment that functions on the lowest-common-denominator: no SLIM, no HAML, no Coffeescript, no Bootstrap. 

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

##Getting Started

1. Install **middlewoman** as Middleman template.

    ```bash
    git clone https://github.com/natbatwat/middlewoman.git ~/.middleman/middlewoman
    ```

2.  Initialize a new Middleman project with the **middlewoman** template

    ```bash
    middleman init my_project_name --template=middlewoman
    cd my_project_name
    ```

4. Install required gems: `bundle update` `bundle install`

5. Run `middleman server`

6. Change ENV variables in the `.env` file. Add `.env` into your `.gitignore` file if you wish!

##TO DO
- Front-end testing
