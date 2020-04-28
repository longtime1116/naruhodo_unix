# ファイルディスクリプ多はプロセス間では共有されない。プロセスにつき、複数のファイルディスクリプ多が存在する
f1 = File.open("./getpid.c")
f2 = File.open("./getpid.c")
f3 = File.open("./getpid.c")
p f1.fileno
p f2.fileno
p f3.fileno

f1.close
#f1.fileno エラーになる


p STDIN.fileno
p STDOUT.fileno
p STDERR.fileno


