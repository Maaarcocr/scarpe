# frozen_string_literal: true

require "webview_ruby"
require "securerandom"
require "json"

require_relative "scarpe/version"
require_relative "scarpe/app"
require_relative "scarpe/colors"
require_relative "scarpe/dimensions"
require_relative "scarpe/html"

require_relative "scarpe/widget"
require_relative "scarpe/para"
require_relative "scarpe/stack"
require_relative "scarpe/flow"
require_relative "scarpe/button"
require_relative "scarpe/image"
require_relative "scarpe/edit_box"
require_relative "scarpe/edit_line"
require_relative "scarpe/alert"

require_relative "scarpe/text_widget"
require_relative "scarpe/strong"

require_relative "scarpe/document_root"

class Scarpe
  class << self
    def app(...)
      app = Scarpe::App.new(...)
      app.init
      app.run
      app.destroy
    end
  end
end
