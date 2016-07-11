RSpec.describe ANSIColor::Formatter do
  let(:colored_text) { <<-OUT
\e[32meu vi\e[0m
\e[4m\e[31mum sapo\e[0m\e[0m
OUT
  }

  describe ".with_codes" do
    let(:enum_text) { described_class.with_codes(colored_text) }
    it "enumerates over text and color codes" do
      first_line = enum_text.next
      expect(first_line[:text]).to eq('eu vi')
      expect(first_line[:codes]).not_to be_empty
      expect(first_line[:codes][0].name).to be(:green)

      second_line = enum_text.next
      expect(second_line[:text]).to eq('um sapo')
      expect(second_line[:codes]).not_to be_empty
      expect(second_line[:codes][0].name).to be(:underline)
      expect(second_line[:codes][1].name).to be(:red)
    end
  end

  describe ".to_hash" do
    let(:enum_text) { described_class.to_hash(colored_text) }
    it "enumerates over text and color codes" do
      first_line = enum_text.next
      expect(first_line[:text]).to eq('eu vi')
      expect(first_line[:codes]).not_to be_empty
      expect(first_line[:codes][0]).to be(:green)

      second_line = enum_text.next
      expect(second_line[:text]).to eq('um sapo')
      expect(second_line[:codes]).not_to be_empty
      expect(second_line[:codes][0]).to be(:underline)
      expect(second_line[:codes][1]).to be(:red)
    end
  end
  describe ".to_json" do
    let(:enum_text) { described_class.to_json(colored_text) }
    it "enumerates over text and color codes" do
      expect(enum_text.next).to include_json(
        text: 'eu vi',
        codes: ['green'])
      expect(enum_text.next).to include_json(
        text: 'um sapo',
        codes: %w(underline red))
    end
  end

  describe ".to_html" do
#    let(:enum_text) { described_class.to_hash(colored_text) }
#    it "enumerates over text and color codes" do
#      first_line = enum_text.next
#      expect(first_line[:text]).to eq('eu vi')
#      expect(first_line[:codes]).not_to be_empty
#      expect(first_line[:codes][0]).to be(:green)
#
#      second_line = enum_text.next
#      expect(second_line[:text]).to eq('um sapo')
#      expect(second_line[:codes]).not_to be_empty
#      expect(second_line[:codes][0]).to be(:underline)
#      expect(second_line[:codes][1]).to be(:red)
#    end
  end

end
