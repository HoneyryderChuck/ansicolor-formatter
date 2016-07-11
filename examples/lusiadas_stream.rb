require "ansicolor/formatter"
require "sinatra"

TEXT = <<-OUT
As armas e os barões assinalados,
Que da ocidental praia Lusitana,
Por mares nunca de antes navegados,
Passaram ainda além da Taprobana,
Em perigos e guerras esforçados,
Mais do que prometia a força humana,
E entre gente remota edificaram
Novo Reino, que tanto sublimaram!
OUT

set :bind, '0.0.0.0'
set :port, 9002


get '/' do
  erb :main
end

get '/activity', provides: 'text/event-stream' do
  stream(keep_open: true) do |out|
    ANSIColor::Formatter.to_json(TEXT).each do |line|
      sleep 0.5
      out << "data: #{line}\n\n"
    end
  end
end

__END__

@@main
<html>
  <head> 
    <title>Os Lusíadas</title> 
    <meta charset="utf-8" />
    <style>
      pre {
        text-align: center;
      }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> 
  </head> 
  <body>
    <article>
      <pre id="book">
      </pre>
    </article>
    <script>
      // reading
      var es = new EventSource('/activity');
      es.onmessage = function(e) { 
        var data = JSON.parse(e.data);
        console.log(data)
        var element = $('<em></em>');
        element.text(data.text);
        element.addClass(data.codes.join(' '));
        
        $('#book').append(element) 
      };

    </script>
  </body>
</html>
