require 'ansicolor/formatter/version'
require 'stringio'
require 'strscan'
require 'term/ansicolor'

module ANSIColor::Formatter
  extend self

  REGEXP = /\e\[((?:[349]|10)[0-7]|[0-9])?m/

  def with_codes(text)
    text = StringIO.new(text) unless text.respond_to?(:each)
    Enumerator.new do |y|
      text.each do |line|
        buffer = String.new
        codes = []
        scanner = StringScanner.new(line)
        while not scanner.eos?
          if scanner.scan(REGEXP)
            code = Term::ANSIColor::Attribute.named_attributes.
                                              find { |c| c.code.eql?(scanner[1]) }
            if code.code == "0"
              if not buffer.empty?
                y << { text: buffer, codes: codes }
              end
              buffer.clear ; codes.pop
            else
              codes.push code
            end
          else
            buffer << scanner.scan(/./m) 
          end
        end
      end
    end
  end
end
