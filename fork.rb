# 子プロセスは親プロセスが使用しているメモリをそのままコピーして引き継ぐ。ファイルディスクリプ多も引き継ぐ
# なので、同じファイルを開いたり閉じたりできる
# 子プロセスがコピーしたメモリは、親プロセス側に影響を与えることなく自由に変更できる


#p "now start #{Process.pid} / #{Process.ppid}"
#if fork
#  puts "entered the if block from #{Process.pid} / #{Process.ppid}"
#else
#  puts "entered the else block from #{Process.pid} / #{Process.ppid}"
#end


# 親側は子プロセスのpid, 子はnilが返る
# p fork


# ブロック内の処理を実行して終わる子プロセス
puts "fork start #{Process.pid} / #{Process.ppid}!"
fork do
  puts "entered the fork block from #{Process.pid} / #{Process.ppid}!"
end

puts "fork finished #{Process.pid} / #{Process.ppid}!"
