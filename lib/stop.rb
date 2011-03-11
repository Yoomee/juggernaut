pid = File.read("node.pid")
%x{ps -ef | grep #{pid}}.split("\n").each do |line|
  if !line.match(/grep/) && res = line.match(/.*\s(\d+)\s#{pid}\s/)
    cpid = res[1]
    %x{kill #{cpid}}
  end
end
%x{kill #{pid}}
%x{rm node.pid}
puts "Stopped node server."