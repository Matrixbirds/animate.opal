# frozen_string_literal: true
require 'opal'
require 'native'
require 'pp'

module Crates
    class Base
        attr_reader :canvas
        def initialize opts={}
            @width = opts[:width]
            @height = opts[:height]
            @canvas = $$[:document].getElementById "panel"
        end
    end
end
