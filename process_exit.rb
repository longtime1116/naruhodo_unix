at_exit {p "finished!"}
p "start!"
# 引数なしだとステータスコードが0(正常終了)
#exit

# exit!はステータスコードが1
# at_exit も実行されない
#exit!


# 任意の終了コードを返すこともできる
#exit 33
#exit! 33



# abort は STDERR にメッセージを吐いた上で、at_exit を発火
#abort "aborted!"



# raise は直ちに終了するわけではなく、捕捉されなかった場合に結果としてプロセスが終了する
# STDERR にメッセージとバックトレースが表示される
raise "raised!!"




# echo $? でステータスコードを確認できる
