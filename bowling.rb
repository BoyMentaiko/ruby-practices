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

frames = shots.each_slice(2).to_a

point = frames.each_with_index.sum do |frame, i| #フレーム数をカウントする
  if i > 8 || frame.sum < 10
    frame.sum
  elsif frame[0] == 10
    next_frame_shots = frames[i.next]
    after_next_frame = frame.sum + next_frame_shots.sum
    after_next_frame += frames[i.next.next][0] if next_frame_shots[0] == 10
    after_next_frame
  elsif frame.sum == 10
    next_frame_shots = frames[i.next]
    frame.sum + next_frame_shots[0]
  end
end

puts point
