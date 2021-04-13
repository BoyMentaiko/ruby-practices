# encoding: utf-8

require "date"
require "optparse"

today = Date.today   # 今日の日付を取得
year = today.year
mon = today.month
month = today.strftime("%B")   # 月の名称を取得
params = ARGV.getopts("", "y:#{today.year}", "m:#{today.month}") #コマンドオプションの設定

year = params["y"].to_i
month = params["m"].to_i

firstday = Date.new(year, mon, 1).wday  #wdayで曜日を返す
lastday = Date.new(year, mon, -1).day
top = "#{month} #{year}"

puts top.center(20)   # 20文字分真ん中に寄せる
puts "日 月 火 水 木 金 土"
print "   " * firstday   # 曜日の余白を作る

(1..lastday).each do |date| # １日から最終日までの日付を出力
  print date.to_s.rjust(2) + " "   # 日付右に寄せる
  firstday = firstday + 1
  if firstday % 7 == 0 # 土曜日まできたら改行
    print "\n" #\nで改行出来る
  end
end
print "\n"   # 最後の改行
