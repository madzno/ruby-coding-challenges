class TextAnalyzer
  def process
    file = File.open("sample_text.txt", 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new

analyzer.process do |text|
  paragraphs = text.split(/\n\n/)
  number_of_paragraphs = paragraphs.count
  puts "#{number_of_paragraphs} paragraphs"
end

analyzer.process do |text|
  lines = text.split(/\n/)
  number_of_lines = lines.count
  puts "#{number_of_lines} lines"
end

analyzer.process do |text|
  words = text.split(' ')
  number_of_words = words.count
  puts "#{number_of_words} words"
end


