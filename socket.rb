require "socket"
# socket は送る側からデリミタを送る必要がない(:DGRAMはデータグラムなので)
child_socket, parent_socket =  Socket.pair(:UNIX, :DGRAM, 0) #=> [#<Socket:fd 7>, #<Socket:fd 8>]
maxlen = 255

fork do
  parent_socket.close

  4.times do
    instruction = child_socket.recv(maxlen)
    child_socket.send("#{instruction} accomplished!", 0)
  end
end
child_socket.close

# send が送られる単位で queue に積まれるっぽい
2.times do
  parent_socket.send("123456789", 0)
end

2.times do
  parent_socket.send("12345", 0)
end

4.times do
  $stdout.puts parent_socket.recv(maxlen)
end
