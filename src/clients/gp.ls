/* MIT License
    (c) 2013 Elizabeth Marston/ Undoware
*/


module.exports :=
  name: 'google-plus'
  api: 'child_process'
  credentials:
      browser: 'firefox'
      submit_url: 'https://plus.google.com/share'
  validator: -> true
  auther: (c, api) ->
    (payload) ->
      #FYI nothing works for FB except the URL so make sure you have good schema.org metadata
      fullurl = c.submit_url ++ \? ++ require('querystring').stringify(payload{url})
      api.spawn c.browser, [ fullurl ]
  writer: (payload, rocket) ->
    rocket payload
