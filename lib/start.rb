pid_file_path = "/var/run/juggernaut.pid"
if File.exists?(pid_file_path)
  puts "Already runnning with pid #{File.read(pid_file_path)}"
else
  %x{mkdir -p /var/run}
  pid = IO.popen("node server.js &> node.log").pid
  File.open(pid_file_path, 'w') {|f| f.write(pid)}
  puts "Started node server with pid #{pid}."
end