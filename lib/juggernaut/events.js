var redis   = require("./redis");

Events = module.exports = {};

Events.client = redis.createClient();

Events.publish = function(key, value){
  this.client.publish(
    "juggernaut:" + key, 
    JSON.stringify(value)
  );
};

Events.subscribe = function(channel, client) {
  this.publish(
    "subscribe", 
    {
      channel:    channel.name,
      meta:       client.meta,
      session_id: client.session_id
    }
  );
  if (client.meta != undefined && client.meta.member_id != undefined) {
    this.client.sadd("channel_" + channel.name + "_subscribers", client.meta.member_id);
  }
};

Events.unsubscribe = function(channel, client) {
  this.publish(
    "unsubscribe",
    {
      channel:    channel.name,
      meta:       client.meta,
      session_id: client.session_id
    }
  );
  if (client.meta != undefined && client.meta.member_id != undefined) {
    this.client.srem("channel_" + channel.name + "_subscribers", client.meta.member_id);
  } 
};

Events.custom = function(client, data) {
  this.publish(
    "custom", 
    {
      meta:       client.meta,
      session_id: client.session_id,
      data:       data
    }
  );
};