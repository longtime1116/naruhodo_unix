require "socket"
# ソケットを開く
socket = TCPServer.open('0.0.0.0', 8080)
# ここでアプリケーションのコードを事前に読み込む # require 'config/environment'
# 関連するシグナルについては子プロセスに転送する
[:INT, :QUIT].each do |signal|
  Signal.trap(signal) {
    wpids.each { |wpid| Process.kill(signal, wpid) }
  } end
# 子プロセスの pid を追跡するため
wpids = []
5.times {
  wpids << fork do
    loop {
      connection = socket.accept
      connection.puts 'Hello Readers!'
      connection.close
      sleep 10
    } end
}
Process.waitall



# 
# ruby prefork.rb をあるプロセスで実行
# 他のプロセスで ps aux | grep prefork すると、6個のプロセスを確認可能。
# 他のプロセスで nc localhost 8080 を連続で実行すると、5回目まではすぐに返ってくるが、その後は10秒経って戻ってきてからになる
