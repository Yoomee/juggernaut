# def get_pid(command)
#   %x{ps -ef | grep \"#{command}\"}.split("\n").each do |line|
#     if !line.match(/grep/) && res = line.strip.match(/^\S*\s+(\d+)\s/)
#       return res[1]
#     end
#   end
#   nil
# end
# 
# def get_child_process(ppid)
#   %x{ps -ef | grep #{ppid}}.split("\n").each do |line|
#     if !line.match(/grep/) && res = line.strip.match(/^.*\s+(\d+)\s+#{ppid}\s/)
#       return res[1]
#     end
#   end
#   nil
# end
# 
# def pid_file_path
#   "/var/run/juggernaut.pid"  
# end
# 
def root_path
  File.dirname(__FILE__) + "/../"
end
# 
# def delete_pid_file
#   %x{rm #{pid_file_path}} if File.exists?(pid_file_path)
# end
# 
# if pid = get_pid("node server.js")
#   File.open(pid_file_path, 'w') {|f| f.write(pid)}
#   puts "Already runnning with pid #{pid}."
# else
#   delete_pid_file
#   %x{mkdir -p /var/run}
#   ppid = IO.popen("cd #{root_path} && node server.js &> /var/log/node.log").pid
#   if (pid = get_child_process(ppid))
#     File.open(pid_file_path, 'w') {|f| f.write(pid)}
#     puts "Started node server with pid #{pid}."
#   else
#     puts "Failed to start node server."
#   end
# end

IO.popen("cd #{root_path} && node server.js &> /var/log/node.log")