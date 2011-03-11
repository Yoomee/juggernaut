pid = File.read("node.pid")
%x{ps -ef | grep #{pid}}.split("\n").each do |line|
  if !line.match(/grep/)
    cpid = line.match(/\d+\s(\d+)/)[1]
    %x{kill #{cpid}}
  end
end
%x{rm node.pid}
puts "Stopped node server."