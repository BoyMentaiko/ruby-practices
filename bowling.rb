score = ARGV[0] #スクリプト実行時に渡された引数を参照する
scores = score.split(",") #点数を分割する
shots = [] #メソッドの呼び出しを定義
scores.each do |t|
  if t == "X"
    shots << 10
    shots << 0
  else
    shots << t.to_i
  end
end

frames = shots.each_slice(2).to_a do |t| # 配列内の要素を2つずつ渡す
  frames << t
end

point = frames.each_with_index.sum do |frame, i| #フレーム数をカウントする
  if i > 8 || frame.sum < 10
    frame.sum
  elsif frame[0] == 10
    extra_point = frames[i.next]
    frame_point = frame.sum + extra_point.sum
    if extra_point[0] == 10
      double_extra_point = frames[i.next.next] # ダブルの場合は20点と次の次のフレームの1投目を加算する
      frame_point + double_extra_point[0]
    else
      frame_point
    end
  elsif frame.sum == 10
    extra_point = frames[i.next]
    frame.sum + extra_point[0]
  end
end

puts point
