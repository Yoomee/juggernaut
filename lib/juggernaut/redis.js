var url     = require("url");
var redis   = require("redis-client");

redis.DEFAULT_PORT = 6380;

module.exports.createClient = function(){
  if (process.env.REDISTOGO_URL) {
    var address = url.parse(process.env.REDISTOGO_URL);
    return redis.createClient(address.port, address.hostname);
  }
  
  return redis.createClient();
};