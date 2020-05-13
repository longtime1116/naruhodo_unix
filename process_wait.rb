p "start!(parent)"
fork do
  5.times do
    sleep 1
    p "child"
  end
end


# 子プロセスのどれか一つが終了するまでの間、待つ
Process.wait
p "parent process died"


p "start(parent)"

3.times do
  fork do
    sleep(rand(5))
    p "child"
  end
end

3.times do
  # 返ってきたプロセスIDを出力
  p Process.wait
end
