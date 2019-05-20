class Ted::Talk
  attr_accessor :title, :speaker, :date, :url

  def self.recent
    self.scrape_talks
  end

  def self.scrape_talks
    talks = []
    talks << self.scrape_tedtalks
    talks
  end

  def self.scrape_tedtalks
    doc = Nokogiri::HTML(open("https://www.ted.com/talks"))
    talk = self.new
    #doc.css("").each.with_index do |info, index|
      #if index >= 1
        #deal.name = info.css("a.itemTitle")[0]['title'].gsub(/\W[a-z][p][a][r]./, "")
        #prices = info.css("div.itemPrice")[0].text.delete!("\n").strip.split()
        # =>[discounted price, old price]
        #deal.price = prices.first
        #deal.old_price = prices.last
        #deal.url = info.css('div.itemBottomRow').first.attr("data-href")
      #else
      #end
        #old_price = info.css(".oldpriceLine").text
        #price = info.css("div.itemPrice")[0].text.gsub("\n","").strip
        #deal
    #end

  end
end
