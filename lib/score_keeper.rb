require_relative "record.rb"

class ScoreKeeper
  END_OF_RECORD = "\n".freeze
  NAME_SCORE_SEPARATOR = ': '.freeze

  def add(string)
    return "" unless valid?(string)
    out = []
    scores = Hash.new(0)
    records = parse(string)
    records.each do |record|
      scores[record.name] = scores[record.name] + record.score.to_i
    end

    scores.keys.sort.each do |key|
      score = scores[key]
      out << "#{key}: #{score > 0 ? '+' : ''}#{score}"
    end
    out.join("\n")
  end

  def valid?(string)
    begin
      records = parse(string)
      records.all?(&:valid?)
    rescue Exception => e
      puts "Exception #{e}"
      false
    end
  end

  private
  def parse(string)
    string.split(END_OF_RECORD).map do |line|
       Record.new(*line.split(NAME_SCORE_SEPARATOR))
    end
  end
end
