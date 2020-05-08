# ファイルディスクリプタのソフトリミット、ハードリミット
# ソフトリミットは Ruby のシステムで決められたもので、引き上げることができる
# ハードリミットはシステムで決まっているものだが、Rubyでは Process::RLIM_INFINITY で設定されている。sysctl(8)参照
p Process.getrlimit(:NOFILE) #=>[256, 9223372036854775807]

Process.setrlimit(:NOFILE, 512)
p Process.getrlimit(:NOFILE)


# 他のリソース
p Process.getrlimit(:NPROC)
p Process.getrlimit(:FSIZE)
p Process.getrlimit(:STACK)
p Process.getrlimit(:CORE)

# 対応するsystem call
# getrlimit(2)
# setrlimit(2)
