module Scarpe
  class Para
    def initialize(app, text)
      @app = app
      @text = Array(text)
      @app.append(render)
    end

    def render
      "<p id=#{object_id}>#{render_text}</p>"
    end

    def render_text
      text
        .map { |t| t.is_a?(Link) ? t.render(self) : t }
        .join
    end

    def replace(new_text)
      app.window.eval("document.getElementById(#{object_id}).innerText = \"#{new_text}\"")
    end

    private

    attr_accessor :text
    attr_reader :app
  end
end
