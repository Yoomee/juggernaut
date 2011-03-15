def get_pids(command)
  pids = []
  %x{ps -ef | grep \"#{command}\"}.split("\n").each do |line|
    if !line.match(/grep/) && res = line.strip.match(/^\S*\s+(\d+)\s/)
      pids << res[1]
    end
  end
  pids
end

pid_file_path = "/var/run/juggernaut.pid"
(pids = get_pids("node server.js")).each do |pid|
  %x{kill #{pid}}
end
if pids.empty?
  puts "node server isn't running."
else
  puts "Stopped node server."
end
%x{rm #{pid_file_path}} if File.exists?(pid_file_path)