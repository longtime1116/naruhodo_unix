pid = fork do
  exit 77
end

pid2 = fork do
  abort "pid2"
end


pid, status = Process.waitpid2 pid
p status

p  pid2
x, y =  Process.wait2
p x
p y




# 実は wait と waitpid は全く同じメソッドを指している。(wait2とwaitpid2も同様)
