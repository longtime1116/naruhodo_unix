trap(:INT) do
  p "This is the first signal handler"
end

old_handler = trap(:INT) do
  old_handler.call
  p "This is the second signal handler"
  exit
end

p Process.pid
sleep

