#!/usr/bin/env node
var fs = require("fs");

Juggernaut = require("./index");
Juggernaut.listen();

// Create pid file
fs.open("/var/run/juggernaut.pid", "w", 0644, function(err, fd) {
  if (err) throw err;
  fs.write(fd, process.pid, 0, "utf8", function(err, written) {
    if (err) throw err;
    fs.closeSync(fd);
  });
});

