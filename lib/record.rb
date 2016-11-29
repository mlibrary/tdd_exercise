class Record
  attr_accessor :name, :score

  VALID_NAME_RE = %r{^[A-Za-z]+$}
  VALID_SCORE_RE = %r{^([+-][0-9]+|0)$}
  FIELD_SEPARATOR = ": ".freeze

  def initialize(name = nil, score = nil)
    @name = name
    @score = score
  end


  def self.parse(line)
    new(*line.split(": ", 2))
  end

  def valid?
    valid_name? && valid_score?
  end

  def valid_name?
    !!(name && VALID_NAME_RE.match(name))
  end

  def valid_score?
    !!(score && VALID_SCORE_RE.match(score))
  end
end
