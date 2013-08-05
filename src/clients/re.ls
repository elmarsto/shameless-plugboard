/* MIT License
    (c) 2013 Elizabeth Marston/ Undoware
*/

module.exports :=
  name: 'reddit'
  api: 'child_process'
  credentials:
      browser: 'firefox'
      submit_url: 'http://www.reddit.com/submit'
  validator: -> true
  auther: (c, api) ->
    (payload) ->
      #Subreddits not working yet TODO FIXME INVESTIGATE does this work for anyone?
      fullurl = c.submit_url ++ \? ++ require('querystring').stringify(payload{title,url,sr:dept})
      api.spawn c.browser, [ fullurl ]
  writer: (payload, rocket) ->
    rocket payload
