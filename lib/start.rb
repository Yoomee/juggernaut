def get_child_process(ppid)
  %x{ps -ef | grep #{ppid}}.split("\n").each do |line|
    if !line.match(/grep/) && res = line.strip.match(/^.*\s+(\d+)\s+#{ppid}\s/)
      return res[1]
    end
  end
end

pid_file_path = "/var/run/juggernaut.pid"
if File.exists?(pid_file_path)
  puts "Already runnning with pid #{File.read(pid_file_path)}"
else
  %x{mkdir -p /var/run}
  ppid = IO.popen("node server.js &> node.log").pid
  pid = get_child_process(ppid)
  File.open(pid_file_path, 'w') {|f| f.write(pid)}
  puts "Started node server with pid #{pid}."
end