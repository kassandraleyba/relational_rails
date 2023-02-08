# README

# One to Many!! 👩‍👧‍👦

![Screen Shot 2023-02-07 at 5 11 03 PM](https://user-images.githubusercontent.com/114712752/217395911-7d2709fb-bdce-4056-950b-27764a6da3d2.png)


* Ruby version

    `ruby 2.7.4` 

* Rails version

    `5.2.8`

* Database creation

    `version: 2023_02_07_201747`

* Database initialization

    `rails db:{drop,create,migrate,seed}`

* How to run the test suite

    - `bundle install` - installs all gems to the system that are listed in Gemfile as well as their dependencies
    - `bundle exec rspec` - runs all tests for BDD
    - `rails s` - starts the server for development testing

* Deployment instructions

    - install ruby version `2.7.4`

    - install Rails version `5.2.8`

    - run `bundle install` in the command line

    - run `rails db:{drop,create,migrate,seed}` in the command line

    - run `bundle exec rspec` to run the test suite

    - run `rails s` to start the server

        - search **localhost:3000** to access the welcome page in the web browser
            - you can access all photographs and artists on this page
            - or search **localhost:3000/artists** to access the artist index page in the web browser
            - or search **localhost:3000/works** to access the works index page in the web browser <br><br>


        ![Screen Shot 2023-02-07 at 5 46 35 PM](https://user-images.githubusercontent.com/114712752/217400205-1aca2a73-9663-4058-b54b-68b23bed37e1.png) 
        <br><br>
        - search **localhost:3000/artists/:id** to access the artist show page in the web browser
        - search **localhost:3000/works/:id** to access the works show page in the web browser

<br><br>

 # Thank You!

