/* MIT License
    (c) 2013 Elizabeth Marston/ Undoware
*/


module.exports =
  name: 'twitter'
  api: 'twit'
  credentials:
    consumer_key: ''
    consumer_secret: ''
    access_token: ''
    access_token_secret: ''
  validator: -> true #TODO check for 120char limit
  auther: (c, tool) ->
    new tool(c)
  writer: (payload, tool) ->
    if (payload.status)
      blurb = "#{payload.status} #{payload.url}"
    else
      blurb = "#{payload.title}: #{payload.url}"
    blurb = "#{blurb} \##{payload.dept}" if (payload.dept)
    err, reply <- tool.post 'statuses/update' { status: blurb }
