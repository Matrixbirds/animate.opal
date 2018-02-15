# frozen_string_literal: true
require 'crates/base'
module Crates

    def setup ins={}
        @ins = ins
    end

    def ctx
        @ins[:ctx]
    end

    def render opts={}
        ctx.beginPath
        ctx.send opts[:call].to_symbol, *opts[:args]
        ctx.fillStyle = opts[:fill_style]
        ctx.fill
        ctx.closePath
    end

    def method_missing(name, *args, &block)
        case name
        when "render_rect"
            render call: "rect", args: args
        when "render_arc"
            render call: "arc", args: args
        else
            raise NoMethodError
        end
    end
end
