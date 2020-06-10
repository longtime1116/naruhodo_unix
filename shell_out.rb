# 1
# # execve(2) によって、プロセスを置き換えてしまう
# exec "ls", "-h"
# # p hoge #=> 実行されない


# 2
# hosts = File.open("/etc/hosts")
# p hosts.fileno
# python_code = %Q[import os; print os.fdopen(#{hosts.fileno}).read()]
# 
# # そのfileno で何を読みたいかを指定すれば良い
# exec "python2.7", "-c", python_code, { hosts.fileno => "/etc/hosts" }


# 3
# # forkして共有された標準ストリームに吐かれるので、一見現在のプロセスからの出力と同じように見える
# p system("ls")
# p system("zzzz")
# 
# 
# # 戻り値は STDOUT を String オブジェクトにまとめたものになる
# p `echo "hoge"`
# p `zzzz`


# 4
# # Process.spawn は生成した子プロセスの終了を待ち合わせない。生成した子プロセスのプロセスIDを返す
# p "now sleep 5 seconds"
# system "sleep 5"
# p "5 seconds slept!"
# system "now sleep 3 seconds"
# pid = Process.spawn "sleep 3"
# p "now sleeping..."
# 
# Process.waitpid(pid)
# p "3 seconds slept!"



# 5
# # IO.popen
# # fork + exec でコマンドを実行 + 生成された子プロセスと通信するためのパイプも繋いでいる
# hoge = ""
# IO.popen("less", "w") do |stream|
#   hoge = stream
#   stream.puts "some\ndata"
# end
# p hoge #=> #<IO:(closed)>
# p "less finished"


# 6
# open3
require "open3"
Open3.popen3("grep", "data") do |stdin, stdout, stderr|
  stdin.puts "some\ndata"
  p "now stdin is open"
  sleep 1
  stdin.close
  puts "stdin closed"
  sleep 1
  puts stdout.read
end

Open3.popen3("ls", "-uhh", :err => :out) do |stdin, stdout, stderr|
  puts stdout.read
end



# posix_spawn(2) を使うと、fork(2)のオーバーヘッドなしにプロセスを生成できる
# posix_spawn は親プロセスがメモリに保持していた内容はコピーしないが、ファイルディスクリプタはコピーされる！
