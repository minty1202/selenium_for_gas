require './access_spread_sheet.rb'
require './selenium.rb'

session = Session.new
sheet = AccessSpreadSheet.new

100.times do |i|
  i = i + 2
  search_url = sheet.generate_url(i)
  next if search_url.nil?

  push_url = session.search(search_url)
  sheet.write(i, push_url)
end

session.quit