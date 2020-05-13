2.times do
  fork do
    p Process.pid
  end
end

p Process.wait
sleep 5

# 親プロセスは子プロセスの終了時点の情報を必ず受け取ることができる
# キューに入っているため
p Process.wait




# Process.wait は waitpid(2) に対応している
