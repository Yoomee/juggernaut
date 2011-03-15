pid_file_path = "/var/run/juggernaut.pid"
pid = File.read(pid_file_path)
%x{kill #{pid}}
# %x{ps -ef | grep #{pid}}.split("\n").each do |line|
#   if !line.match(/grep/) && res = line.strip.match(/^.*\s+(\d+)\s+#{pid}\s/)
#     cpid = res[1]
#     %x{kill #{cpid}}
#   end
# end
%x{rm #{pid_file_path}}
puts "Stopped node server."