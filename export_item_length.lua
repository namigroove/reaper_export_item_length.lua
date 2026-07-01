-- 選択したメディアアイテムの秒数・分秒・合計時間を出力するスクリプト
local num_items = reaper.CountSelectedMediaItems(0)

if num_items == 0 then
  reaper.ShowConsoleMsg("アイテムが選択されていません。\n")
else
  reaper.ClearConsole() -- コンソールを初期化
  reaper.ShowConsoleMsg("【選択アイテムの長さ一覧】\n")
  reaper.ShowConsoleMsg("番号\t長さ(分:秒)\t長さ(秒)\tアイテム名\n")
  
  -- === 【追加】合計秒数を記録する変数 ===
  local total_length = 0
  
  for i = 0, num_items - 1 do
    local item = reaper.GetSelectedMediaItem(0, i)
    local length = reaper.GetMediaItemInfo_Value(item, "D_LENGTH")
    
    -- 合計に加算
    total_length = total_length + length
    
    -- 秒数を分・秒に分解
    local minutes = math.floor(length / 60)
    local seconds = length % 60
    local min_sec_str = string.format("%d:%06.3f", minutes, seconds)
    
    -- アイテム名を取得
    local take = reaper.GetActiveTake(item)
    local take_name = "（名前なし）"
    if take then
      take_name = reaper.GetTakeName(take)
    end
    
    -- コンソールに出力
    reaper.ShowConsoleMsg(string.format("%d\t%s\t%.3f\t%s\n", i + 1, min_sec_str, length, take_name))
  end
  
  -- === 【追加】ループ終了後に合計時間を計算して表示 ===
  local total_min = math.floor(total_length / 60)
  local total_sec = total_length % 60
  
  reaper.ShowConsoleMsg("--------------------------------------------------\n")
  reaper.ShowConsoleMsg(string.format("選択アイテム数: %d 個\n", num_items))
  reaper.ShowConsoleMsg(string.format("合計時間: %d分 %06.3f秒 （解釈用: %d:%06.3f）\n", total_min, total_sec, total_min, total_sec))
  reaper.ShowConsoleMsg(string.format("合計秒数: %.3f 秒\n", total_length))
end
