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
        case opts[:call]
        when 'rect'
            ctx.rect *opts[:args]
        when 'arc'
            ctx.arc *opts[:args]
        end
        ctx.fillStyle = opts[:fill_style]
        ctx.fill
        ctx.closePath
    end

    def method_missing(name, opts={}, &block)
        case name
        when "render_rect"
            render({:call => "rect"}.merge({
                :args => opts[:args],
                :fill_style => opts[:fill_style]
            }))
        when "render_arc"
            render({:call => "arc"}.merge({
                :args => opts[:args],
                :fill_style => opts[:fill_style]
            }))
        else
            raise NoMethodError
        end
    end
end
