/* MIT License
    (c) 2013 Elizabeth Marston/ Undoware
*/


module.exports :=
  name: 'facebook'
  api: 'child_process'
  credentials:
      browser: 'firefox'
      submit_url: 'https://www.facebook.com/sharer/sharer.php'
  validator: -> true
  auther: (c, api) ->
    (payload) ->
      #FYI nothing works for FB except the URL so make sure you have good OpenGraph metadata
      fullurl = c.submit_url ++ \? ++ require('querystring').stringify(payload{u:url})
      api.spawn c.browser, [ fullurl ]
  writer: (payload, rocket) ->
    rocket payload
