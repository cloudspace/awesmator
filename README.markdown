# Awesmator

Ruby module that provides access to the awe.sm API

## Methods
awesmate, awesm_lookup

awesmate: create an awe.sm short url

awesm_lookup: lookup data for an awe.sm url

## to use this module
put the awesmator.rb file in your lib folder

then include it in the model you want to make it available in
    class Post < ActiveRecord::Base
      include Awesmator

## creating a short url
call it in a controller 
    url = "http://www.cloudspace.com"
    @post = Post.first
    new_short_url = @post.awesmate(API_KEY, url)

## doing a lookup
call it in a controller
    stub = 'c'
    @post = Post.first
    lookup_info = @post.awesm_lookup(API_KEY, stub)
    puts lookup_info['redirect_url'] # http://google.com



developed & maintained by:

Michael Orr github.com/imightbeinatree
Corey Reece github.com/corey

Cloudspace
http://www.cloudspace.com
http://github.com/cloudspace
