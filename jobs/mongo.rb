require 'mongo'

mongo_config = YAML.load File.open("mongo.yml")
mongo_host = mongo_config[:mongo_host]
mongo_username = mongo_config[:mongo_username]
mongo_password = mongo_config[:mongo_password]

mongo = Mongo::Client.new([ mongo_host ],
          :username => mongo_username, :password => mongo_password)

SCHEDULER.every('5m', first_in: '1s') {
    info = mongo.command({ serverStatus: 1 }).to_a

    send_event('mongo_connected_clients', {
        current: info[0]['connections']['current'],
        moreinfo: "Number of connected clients"
    })
}
