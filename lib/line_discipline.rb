module Rue

  class LineDiscipline
    def initialize
      @line = ''
    end
    def complete?
      @complete || false
    end
    def add(c)
      if complete? || c == "\r"
        @complete = true
        return "\r\n"
      end
      @line +=c
      c
    end
    def to_s
      @line
    end
  end
end