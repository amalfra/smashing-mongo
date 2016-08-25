require 'mongo'

MEGABYTE = 1024.0 * 1024.0

mongo_config = YAML.load File.open("mongo.yml")
mongo_host = mongo_config[:mongo_host]
mongo_username = mongo_config[:mongo_username]
mongo_password = mongo_config[:mongo_password]

if mongo_username and mongo_password
    mongo = Mongo::Client.new([ mongo_host ],
              :user => mongo_username, :password => mongo_password)
else
    mongo = Mongo::Client.new([ mongo_host ])
end

SCHEDULER.every('5m', first_in: '1s') {
    info = mongo.command({ serverStatus: 1 }).to_a

    send_event('mongo_connected_clients', {
        max: info[0]['connections']['available'].to_i,
        value: info[0]['connections']['current'].to_i,
        moreinfo: "Connected clients"
    })

    # Convert network in/out in bytes to MB
    network_in = info[0]['network']['bytesIn'] / MEGABYTE
    network_out = info[0]['network']['bytesOut'] / MEGABYTE
    send_event('mongo_network_info', {
        network_requests: info[0]['network']['numRequests'],
        network_in: network_in,
	network_out: network_out,
        moreinfo: "Network traffic info"
    })
}
