child_process = 3
dead_process = 0

child_process.times do
  fork do
    p "child pid: #{Process.pid}"
    sleep 3
  end
end



$stdout.sync = true

trap(:CHLD) do
  begin
    # 終了を待つ子プロセスが無ければブロックしないようカーネル に指示するフラグ
    # 一度のシグナルキャッチ中に何回かProcess.waitで複数のものが取れる状態になっているとまずいので、while で回している
    # SIGCHLD が来たけど子プロセスがないときにハングしないようにできる
    while pid = Process.wait(-1, Process::WNOHANG)
      puts pid
      dead_process += 1
    end
  rescue Errno::ECHILD
    p "error"
  end
# ↓前段階
  #p Process.wait
  #dead_process += 1
  #if dead_process == child_process
  #  p "finished!"
  #  exit
  #end
end

loop do
  exit if dead_process == child_process
  p "parent working..."
  sleep 1
end
