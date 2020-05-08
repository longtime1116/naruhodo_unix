ary = [1,2,3]
fork do
  # ここではメモリのコピーは行われない。参照しているだけなので
  p ary
end

fork do
  # この時点でメモリのコピーは行われる。
  ary << 4
  p ary
end
