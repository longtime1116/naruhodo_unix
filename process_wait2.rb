5.times do
  fork do
    if rand(5).even?
      exit 111
    else
      exit 112
    end
  end
end

# 二つ目の戻り値はstatus Process::status
5.times do
  pid, status = Process.wait2

  if status.exitstatus === 111
    p "(even) pid: #{pid}, status: \"#{status}\""
  else
    p "(odd) pid: #{pid}, status: \"#{status}\""
  end
end
