require 'dotenv'
require "google_drive"

class AccessSpreadSheet

  Dotenv.load

  # api reference
  # https://www.rubydoc.info/gems/google_drive
  # 認証方法
  # https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
  # [行, 列]で指定

  def initialize
    @session = GoogleDrive::Session.from_service_account_key("env.json")
    @sheet = @session.spreadsheet_by_key(ENV['SHEET_ID']).worksheets[1]
    @image_id_column = 10
    @image_column = 11
  end

  def write(row, url)
    return unless @sheet[row,@image_column].empty?

    @sheet[row,@image_column] = url
    @sheet.save
  end

  def generate_url(row)
    photo_id = @sheet[row,@image_id_column]
    return if photo_id.empty? || !@sheet[row,@image_column].empty?
    url = "https://maps.googleapis.com/maps/api/place/photo?photo_reference=#{photo_id}&maxwidth=300&key=#{ENV['API_KEY']}"
  end

  def test
    image_id = @sheet[1,@image_id_column]
    image = @sheet[1,@image_column]
    puts "取得予定のimage_idの1行目に書かれている内容 #{image_id}"
    puts "出力予定imageの1行目に書かれている内容 #{image}"
  end
end
