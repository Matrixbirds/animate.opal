# frozen_string_literal: true
require 'opal'
require 'native'
require 'crates'

include Crates

crates = Base.new width: 480, height: 320

setup ctx: crates.canvas
render_rect rect: [20, 40, 50, 50], fill_style: "#FF0000"
