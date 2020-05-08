fork do
  5.times do
    puts "orphan! #{Process.pid} / #{Process.ppid}"
    sleep 1
  end
end
abort "Parent process died..."
