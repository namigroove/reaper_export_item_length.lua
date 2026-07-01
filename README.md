# reaper_export_item_length.lua
reaperで選択itemの長さをポップアップに出力するスクリプト
ライブ尺把握用等に
<img width="795" height="589" alt="image" src="https://github.com/user-attachments/assets/44d4141d-f6ef-4214-a855-a236b97f5c49" />

**Luaスクリプトの導入手順**

フォルダを開く: REAPERのメニューバーから Options > Show REAPER resource path in explorer/finder を選択します。
スクリプトを保存: 開いたフォルダの中にある Scripts フォルダを開き、その中にダウンロードした .lua ファイルを配置します。
アクションリストを開く: REAPERのメニューから Actions > Show action list を開きます。
スクリプトの読み込み: 右下の New action > Load Reascript... をクリックし、手順2で保存した .lua ファイルを選択して開きます。

**ツールバーへ登録しとくと便利**

1. ツールバーの編集画面を開く登録したいツールバーを右クリックします。Customize toolbar... を選択します。
2. スクリプトの追加編集画面の右側にある Add ボタンをクリックします。アクションリストが開くので、登録したスクリプトを検索します。スクリプトを選択し、右下の Select/add をクリックして閉じます。
3. ボタンの見た目を変更（任意）追加されたスクリプトをリスト上で選択します。
下部の Icon ボタンをクリックします。Change icon でアイコン画像を選ぶか、Text icon で文字（「MIDI割当」など）を入力します。
4. 保存編集画面の右下にある Save をクリックします。
5. <img width="722" height="1196" alt="image" src="https://github.com/user-attachments/assets/6474d77c-55c4-4e56-adda-9fc343e502f7" />
