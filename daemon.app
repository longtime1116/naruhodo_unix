def daemonize_app

  # 子プロセスの場合はnilが返るので、終了しない
  exit if fork

  # 1. プロセスを新しいセッションのセッションリーダーにする
  # 2. プロセスを新しいプロセスグループのプロセスグループリーダーにする
  # 3. プロセスから制御端末を外す
  Process.setsid

  # ここでもう一度親を殺して孤児とすることで、プロセスグループリーダーでもなくセッションリーダーでもなく、制御端末を持たない親の子供なので、制御端末を持たないことが保証されていると言える
  # 非同期なので順序を保証できないのでやる必要がある
  exit if fork

  Dir.chdir "/"
  STDIN.reopen "/dev/null"
  STDOUT.reopen "/dev/null", "a"
  STDERR.reopen "/dev/null", "a"
end



# 親と子は同じグループになり、そのグループを表すIDは親プロセスのプロセスIDとなっている
puts Process.getpgrp
puts Process.pid

fork do
  puts Process.pid
  puts Process.getpgrp
end



# 親プロセスが終了しても基本的には子プロセスは終了せず、孤児プロセスとなる
# ただし、端末はシグナルを受け取ると、フォアグラウンドのプロセスが属するプロセスグループに含まれる全てのプロセスを殺す


# セッショングループは、プロセスグループの集合
# 例えば↓は3つのプロセスが走るが、それぞれの間に親子関係はないので(これはよくわからない)、プロセスグループは3つできる
# しかし Ctrl-C でまとめて殺せる
# git log | grep update | less




