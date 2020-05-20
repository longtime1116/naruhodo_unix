reader, writer = IO.pipe

#writer.write("Into the pipe I go...")
#writer.close
#p reader.read



fork do
  sleep 1
  reader.close
  10.times do
    writer.puts "Another one bites the dust"
  end

  # writer.close もしくは子プロセスの死を検知して、親はgetsをやめる
  sleep 5
  writer.close
end

writer.close
loop do
  message = reader.gets
  break if message.nil?
  $stdout.puts message
end
#reader.close


# 4つのオブジェクト
# parent - reader -> pipeA の読み口
# parent - writer -> pipeA の書き口
# child  - reader -> pipeA の読み口
# child  - writer -> pipeA の書き口
