-- 選択したメディアアイテムの秒数をコンソールに出力するスクリプト
local num_items = reaper.CountSelectedMediaItems(0)

if num_items == 0 then
  reaper.ShowConsoleMsg("アイテムが選択されていません。\n")
else
  reaper.ClearConsole() -- コンソールを初期化
  reaper.ShowConsoleMsg("【選択アイテムの長さ一覧（秒）】\n")
  reaper.ShowConsoleMsg("番号\t長さ(秒)\tアイテム名\n")
  
  for i = 0, num_items - 1 do
    local item = reaper.GetSelectedMediaItem(0, i)
    local length = reaper.GetMediaItemInfo_Value(item, "D_LENGTH")
    
    -- アイテム名を取得（アクティブテイクがある場合）
    local take = reaper.GetActiveTake(item)
    local take_name = "（名前なし）"
    if take then
      take_name = reaper.GetTakeName(take)
    end
    
    -- 小数点以下3桁に丸めてコンソールに表示
    reaper.ShowConsoleMsg(string.format("%d\t%.3f\t%s\n", i + 1, length, take_name))
  end
end