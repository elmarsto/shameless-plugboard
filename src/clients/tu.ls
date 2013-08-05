/* MIT License
    (c) 2013 Elizabeth Marston/ Undoware
*/

require! \util

#declare here for closure
blog = \undoware.tumblr.com

module.exports :=
  name: \tumblr
  blog: blog
  credentials:
    consumer_key: ''
    consumer_secret: ''
    token: ''
    token_secret: ''
  api: 'tumblr.js'
  validator: -> true #everything is permitted
  auther: (c, api) ->
    api.createClient c

  writer: (payload, api, blogname = blog) ->
    slug = payload{url,title}
    console.log util.inspect slug
    err,data  <- api.link blogname,slug
    console.log err
    console.log data
