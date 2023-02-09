class Scarpe
  class Strong  < Scarpe::TextWidget
    def initialize(text)
      @text = text
    end

    def element
      "<strong>#{@text}</strong>"
    end
  end
end
