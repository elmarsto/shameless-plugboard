/* MIT License
    (c) 2013 Elizabeth Marston/ Undoware
*/


module.exports :=
  name: 'hackernews'
  api: 'superagent'
  validator: -> true
  credentials:
    user: '---usercookie---'
  auther: (cred, api) ->
    api.get('http://news.ycombinator.com/r').set('Cookie', "user=#{cred.user}")
  writer: (payload, api) ->
    resp <- api.query({u: payload.url, t: payload.title}).end
    console.log resp if resp

