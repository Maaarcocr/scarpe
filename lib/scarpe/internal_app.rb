module Scarpe
  class InternalApp
    attr_reader :window
    attr_reader :debug
    attr_accessor :current_id

    def initialize(window, opts = {})
      @window = window
      @current_id = object_id
      @callbacks = {}
      @opts = opts
      @debug = opts[:debug] ? true : false
    end

    def bind(name, &block)
      @callbacks[name] = block
    end

    def handle_callback(name, *args)
      @callbacks[name].call(*args)
    end

    def render(&block)
      instance_eval(&block)
    end

    def do_js_eval(js)
      @window.eval(js + ";")
    end

    def append(el)
      @window.eval("document.getElementById(#{current_id}).insertAdjacentHTML('beforeend', \`#{el}\`)")
    end

    def remove(id)
      @window.eval("document.getElementById(#{id}).remove()")
    end

    def para(*text)
      Scarpe::Para.new(self, text)
    end

    def stack(width: nil, margin: nil, &block)
      Scarpe::Stack.new(self, width:, margin:, &block)
    end

    def flow(&block)
      Scarpe::Flow.new(self, &block)
    end

    def button(text, width: nil, height: nil, top: nil, left: nil, &block)
      Scarpe::Button.new(self, text, width:, height:, top:, left:, &block)
    end

    def image(url)
      Scarpe::Image.new(self, url)
    end

    def edit_line(text = "", width: nil, &block)
      Scarpe::EditLine.new(self, text, width:, &block)
    end

    def alert(text)
      Scarpe::Alert.new(self, text)
    end

    def js_eval(js_code)
      Scarpe::JSEval.new(self, js_code)
    end

    def link(text, &block)
      Scarpe::Link.new(self, text, &block)
    end
  end
end
