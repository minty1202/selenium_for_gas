# 実行方法

```bash
bundle install --path vendor/bundle
bundle exec ruby process.rb
```

## 設定方法

以下urlを参照してスプレッドシートにアクセスできるようにしてください  
[url](https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md)  
`AccessSpreadSheet`の`initialize`にある

```ruby
@session.spreadsheet_by_key(ENV['SHEET_ID']).worksheets[1] # シート番号何枚目か 0が一枚目
@image_id_column # image_idのある列 A列が1
@image_column # imageのある列 A列が1
```

が取得と出力に関係しています。  
それぞれ対応するものを設定してください

### 必要な環境変数

```env
SHEET_ID # スプレッドシートのID
API_KEY # google map の api key
```

### テスト方法

正常に値が取れるか、出力されるかどうか心配なら

```bash
bundle exec ruby test_access_spred_sheet.rb
```

を実行してください。  
1行目の内容を表示てくれます。  
基本的にはそこの列を基準に取得と出力をします。
