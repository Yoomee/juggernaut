if File.exists?("node.pid")
  puts "Already runnning with pid #{File.read("node.pid")}"
else
  pid = IO.popen("node server.js &> node.log").pid
  File.open("node.pid", 'w') {|f| f.write(pid)}
  puts "Started node server with pid #{pid}."
end