Record = Struct.new(:name, :score)
class Record
  VALID_NAME_RE = %r{^[A-Za-z]+$}
  VALID_SCORE_RE = %r{^([+-][0-9]+|0)$}

  def valid?
    valid_name? && valid_score?
  end

  def valid_name?
    name && VALID_NAME_RE.match(name)
  end

  def valid_score?
    score && VALID_SCORE_RE.match(score)
  end
end
