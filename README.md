# README

## Running app

1. Install all dependencies:
`bundle install`

2. Create db and migrate schema:
`rails db:create`
`rails db:seed`
`rails db:migrate`

3. Run app:
`rails s`

## Calling API
Call API via `localhost:3000/json_objects`

To create or update JSON, POST or PUT with JSON file. 
Example POST using [httpie:](https://httpie.org/) `http POST :3000/json_objects < foo.json`

To receive JSON objects, call `http GET localhost:3000/json_objects` to get the full list or `http GET localhost:3000/json_objects/:id` for specified object.

To delete object, call `http DELETE localhost:3000:json_objects/:id`

## Problem Solving Process

This is the first time I have built an API! Fun times :)  

As the task was completely new to me, I started by investigating Rails' patterns for API creation. I practised this by creating a model class called `Bicycle` to get me familiar with sending and receiving JSON via RESTful routes. I added tests to ensure that the API was working according to my expectations and added a few helper methods to aid testing and controller actions.

Once I felt I had understood the patterns and behaviour of building an API in Rails, I turned to solving the problem of storing JSON. I've not worked with non-relational DBs relative to Rails before, but time limitations did not allow me to investigate this option. Instead I have compromised by building a table in the SQLite DB that will hold JSON as a string. 

## If I had more time...

This solution is far from ideal. If I had more time I would like to: 
1. Investigate non-relational DB options that integrate with Rails (probably MongoDB)
2. Figure out how to remove the current `json_string` key that holds the JSON within the relational DB. I am so annoyed by this(!) - a non-relational DB would likely solve this issue. 
3. Finished off my `json_objects_controller` request testing - I have been unable to find the syntax for RSpec to mock a file that is POSTed in a request. Tests are currently commented out and unfinished.
4. Looked at security a bit more - I am not feeling great about any old JSON getting stored in the DB. Could there be some level of authentication or security?

## What I learned
1. How to create a RESTful API in Rails (nice!) 
2. A new bit of Rails magic - `request.raw_post`
3. SQLite has limited capacity to handle JSON - and generally relational DBs are probably not ideal when we are talking about JSON objects that do not have any model underpinnings.
