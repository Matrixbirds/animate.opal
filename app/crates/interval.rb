# frozen_string_literal: true
module Crates
    class Interval
        def initialize(time=0, &block)
            @interval = `setInterval(#{block.call}, #{time})`
        end

        def stop
            `clearInterval(#{@interval})`
        end
    end
end