p Process.pid
trap(:INT) do
  # これをすると SIGINTで殺せなくなる
  # SIGKILL 使えば殺せる
  p "catch SIGINT signal!"
end

# ↓で無視も可能
# trap(:INT, "IGNORE")
sleep


# これを実行した状態で、
# ps aux | grep sleep
# これでわかった pid を使って、別の irb から
# Process.kill(:INT, pid)
# すると、殺せる





# 対応
# Process.kill は kill(2)
# Kernel.trap は sigaction(2)
# signal(7) も要チェック
