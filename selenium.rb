require 'selenium-webdriver'
class Session
  
  def initialize
    @session = Selenium::WebDriver.for :chrome
    # 10秒待っても読み込まれない場合は、エラーが発生する
    @session.manage.timeouts.implicit_wait = 10
  end

  def search(url)
  
    # ページ遷移する
    @session.navigate.to url
    sleep 1
    @session.find_element(:tag_name, 'img').attribute('src')
  end

  def quit
    @session.quit
  end
end
