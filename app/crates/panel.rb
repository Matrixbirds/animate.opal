# frozen_string_literal: true
module Crates
    class Panel
        attr_reader :height, :width, :canvas, :context, :max_x, :max_y
        attr_accessor :state, :seed

        CELL_HEIGHT = 15
        CELL_WIDTH = 15

        def initialize
            @height = 480
            @width = 320
            @canvas = `document.getElementById(#{canvas_id})`
            @context = `#{canvas}.getContext('2d')`
            @max_x = (height / CELL_HEIGHT).floor
            @max_y = (width / CELL_WIDTH).floor
            @state = nil
            @seed = []
        end

        def canvas_id
            "panel"
        end

        # def draw_canvas
        # end

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
end