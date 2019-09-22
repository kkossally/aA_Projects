class Card
  attr_accessor :face_up
  attr_reader :value

  def initialize(value)
    @face_up = false
    @value = value
  end

  def hide
    self.face_up = false
  end
  
  def reveal
    self.face_up = true
  end

  def to_s
    value.to_s
  end

  def ==(card)
    value == card.value
  end

end