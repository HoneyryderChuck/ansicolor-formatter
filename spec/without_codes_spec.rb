RSpec.describe ANSIColor::Formatter do
  context "when there are no colors involved" do
    let(:text) { <<-OUT
ginguba kaombo leite
sambuca cassula giboia
    OUT
    }
    it "iterates freely" do
      enum_text = described_class.with_codes(text) 
      first_line = enum_text.next
      expect(first_line[:text]).to eq("ginguba kaombo leite\n")
      expect(first_line[:codes]).to be_empty

      second_line = enum_text.next
      expect(second_line[:text]).to eq("sambuca cassula giboia\n")
      expect(second_line[:codes]).to be_empty
    end
  end
end
