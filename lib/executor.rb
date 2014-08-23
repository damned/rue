module Rue

  class Executor
    def initialize(terminal)
      @context = ExecutionContext.new(terminal)
    end
    def exec(line)
      @context.instance_eval line.to_s
    end
  end

end