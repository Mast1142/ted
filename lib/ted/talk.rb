class Ted::Talk
  attr_accessor :title, :speaker, :date, :url, :length
  @@all = []

  def self.recent
    self.scrape_tedtalks
  end

  def self.scrape_tedtalks
    doc = Nokogiri::HTML(open("https://www.ted.com/talks"))
    doc.css("div.media").collect do |x|
      talk = self.new
      @@all << talk
      talk.speaker = x.css(".h12").text
      talk.url = x.css("a.ga-link").first.attr("href").strip
      talk.date = x.css("span.meta__val").text.strip
      talk_info = x.css("a.ga-link").text.strip.split("\n")
      talk.title = talk_info[2]
      talk.length = talk_info[0]
    end
    @@all
  end
end
