# frozen_string_literal: true
require 'opal'
require 'native'
require 'crates'

include Crates

WIDTH = 480
HEIGHT = 320

crates = Panel.new

crates.render_arc args: [40, 50, 10, 0, $$.Math.PI * 2], fill_style: "#0095DD"