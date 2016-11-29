require_relative "record.rb"

class ScoreKeeper
  END_OF_RECORD = "\n".freeze

  def initialize(string)
    @scores = Hash.new(0)
    add(string)
  end

  def add(string)
    return unless self.class.valid?(string)
    records = self.class.parse(string)
    records.each do |record|
      @scores[record.name] = @scores[record.name] + record.score.to_i
    end
  end


  def to_s
    out = []
    @scores.keys.sort.each do |key|
      score = @scores[key]
      out << "#{key}: #{score > 0 ? '+' : ''}#{score}"
    end
    out.join("\n")
  end

  def self.valid?(string)
    begin
      records = parse(string)
      records.all?(&:valid?)
    rescue Exception => e
      puts "Exception #{e}"
      false
    end
  end

  private
  def self.parse(string)
    string.split(END_OF_RECORD).map do |line|
       Record.parse(line)
    end
  end
end
