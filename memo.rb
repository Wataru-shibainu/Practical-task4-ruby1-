require "csv" 

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する/ ctr+C → プロセスを終了する"

memo_type = gets.to_i 

# 新規メモ作成
if memo_type==1
    
    puts "作成したいメモ（.csv）のファイル名を入力してください（拡張子は除く）。"
    puts  "入力後はenterを押してください。"
    file_name = gets.chomp!
    
    puts "メモ内容を入力してください。"
    puts "入力後は'ctr+D'を押してください。"
    
    CSV.open("#{file_name}.csv", "w") do |content|
    note_content = STDIN.read
    content << [note_content]

end

# 既存のメモに追記
elsif memo_type==2
    
    puts "追記したいファイルの名前を入力してください（拡張子は除く）。"
    file_name = gets.chomp!
    
    puts "現在の内容は以下の通りです。"
    old_content = CSV.read("#{file_name}.csv")
    puts old_content
    
    CSV.open("#{file_name}.csv","a") do |content|
    
    puts "追記したい内容を入力して下さい。\n入力後は'ctr+D'を押してください。"
    add_content = STDIN.read
    content<<[add_content]
    
    end
 
    puts "追記後は以下の通りです。"
    new_content = CSV.read("#{file_name}.csv")
    puts new_content
 
end
