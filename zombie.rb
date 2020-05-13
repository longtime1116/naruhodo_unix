pid = fork do
  sleep 1
end

puts pid

# ↓これをやるとゾンビにならない。新しいスレッドを生成してそこでwaitしてくれる
# Process.detach pid

sleep 10
# この sleep 中に↓を実行
# ps -ho pid,state -p [ゾンビになったプロセスの pid]
#
# ↓こんな感じになる。Z+は zombie
#  PID STAT
# 13688 Z+
#
#
# 10秒たつと、なくなる
#   PID STAT






