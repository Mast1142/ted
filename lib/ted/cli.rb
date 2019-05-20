# CLI Controller - welcoming user, taking input
class Ted::CLI

  def call
    puts "Welcome to TedTalk CLI"
    list_talks
    menu
    goodbye
  end

  def list_talks
    puts "Recent Ted Talks"
    @talks = Ted::Talk.recent
    @talks.each.with_index(1) do |talk, i|
      puts "#{i}." "#{talk.title} - #{talk.speaker}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the deal you'd like more info on or list to see the list again. Type exit to quit the program."
      input = gets.strip.downcase
      if input.to_i > 0
        the_talk = @talks[input.to_i-1]
        puts "#{the_talk.title} - #{the_talk.speaker}"
      elsif input == "list"
        list_talks
      else
        puts "Invalid entry, type list or exit."
      end
    end
  end

  def goodbye
    puts "goodbye"
  end
end
