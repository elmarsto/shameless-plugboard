
require! util
require! optimist

argv = optimist
  .usage 'Usage: -u <url> -c <hn:fb:gp:...> [ -t <title> ] [ -x <excerpt> ] [ -d <dept> ] [ -s <microblog-status> ]'
  .demand(<[ u c ]>)
  .argv

console.log util.inspect argv

let payload = argv{url:u,status:s,title:t,excerpt:x,dept:d}, clients = argv.c / \:
    main payload, clients

function main(payload,names)
  clients = [ require("./clients/#{name}") for name in names ]
  for let client in clients
    let api_factory = require(client.api)
      try
        let api = client.auther(client.credentials,api_factory)
          if client.validator?
            process.exit(-1) unless client.validator(payload)
          try
            client.writer(payload,api)
          catch
            console.log "#{client.name} #e"

