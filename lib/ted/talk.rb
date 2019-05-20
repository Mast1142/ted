class Ted::Talk
  attr_accessor :title, :speaker, :date, :url, :length

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
    doc.css("div.media").each do |x|
      speaker = x.css(".h12").text
      url = x.css("a.ga-link").first.attr("href").strip
      date = x.css("span.meta__val").text.strip
      talk_info = x.css("a.ga-link").text.strip.split("\n")
      title = talk_info[2]
      length = talk_info[0]
      binding.pry
    end
  end
end
