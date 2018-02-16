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
        $$.console.log "opts", *opts
        ctx.beginPath
        ctx.send opts[:call].to_sym, *opts[:args]
        ctx.fillStyle = opts[:fill_style]
        ctx.fill
        ctx.closePath
    end

    def method_missing(name, *args, &block)
        opts = args[0]
        opts_0 = args[1]
        case name
        when "render_rect"
            render call: "rect", rect: opts[:rect], fill_style: opts[:fill_style]
        when "render_arc"
            render call: "arc", rect: opts[:rect], fill_style: opts[:rect]
        else
            raise NoMethodError
        end
    end
end
