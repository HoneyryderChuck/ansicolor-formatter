require 'ansicolor/formatter'

puts "hey ho let's go"

ANSIColor::Formatter.with_codes(DATA).each do |line|
  puts "line: \"#{line[:text]}\" with #{line[:codes].map(&:name).join(',')}"
end

__END__
[32meu vi[0m
[4m[31mum sapo[0m[0m
[32meu vi[0m
[4m[31mum sapo[0m[0m
[32meu vi[0m
[4m[31mum sapo[0m[0m
[32meu vi[0m
[4m[31mum sapo[0m[0m
[32meu vi[0m
[4m[31mum sapo[0m[0m
[32meu vi[0m
[4m[31mum sapo[0m[0m
[32meu vi[0m
[4m[31mum sapo[0m[0m
[32meu vi[0m
[4m[31mum sapo[0m[0m
[32meu vi[0m
[4m[31mum sapo[0m[0m
[32meu vi[0m
[4m[31mum sapo[0m[0m
