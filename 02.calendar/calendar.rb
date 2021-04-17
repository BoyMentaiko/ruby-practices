# encoding: utf-8

require "date"
require "optparse"

today = Date.today   # 今日の日付を取得
year = today.year    # 今日の西暦を取得
mon = today.mon      # 今日の月を取得
params = ARGV.getopts("", "y:#{today.year}", "m:#{today.mon}") #コマンドオプションの設定

year = params["y"].to_i
month = params["m"].to_i

day_of_the_week = Date.new(year, mon, 1).wday  #wdayで曜日を返す
last_month_day = Date.new(year, mon, -1).day
top = "#{month}月 #{year}"

puts top.center(20)   # 20文字分真ん中に寄せる
puts "日 月 火 水 木 金 土"
print "   " * day_of_the_week   # 曜日の余白を作る

(1..last_month_day).each do |date| # １日から最終日までの日付を出力
  print date.to_s.rjust(2) + " "   # 日付右に寄せる
  day_of_the_week = day_of_the_week + 1
  if day_of_the_week % 7 == 0 # 土曜日まできたら改行
    print "\n" #\nで改行出来る
  end
end
print "\n"   # 最後の改行
