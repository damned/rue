module Rue

  class Terminal
    def get_char
      STDIN.getch
    end
    def print(s)
      STDOUT.print s
    end
  end

end