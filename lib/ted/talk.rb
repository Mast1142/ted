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
    talk = self.new
    doc.css("div.media").each do |x|
      talk.speaker = x.css(".h12").text
      talk.url = x.css("a.ga-link").first.attr("href").strip
      talk.date = x.css("span.meta__val").text.strip
      talk_info = x.css("a.ga-link").text.strip.split("\n")
      talk.title = talk_info[2]
      talk.length = talk_info[0]
    end
    talk
  end
end

