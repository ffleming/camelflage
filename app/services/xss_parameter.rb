class XSSParameter
  attr_reader :html

  def initialize(string)
    @html = interpolate(string).html_safe
  end

  def hint
    'Hello #{name}!'
  end

  private

  def interpolate(string)
    <<-EOF.strip_heredoc
    <html>
      <head></head>
      <body>
      <h1>Hello #{string}!</h1>
      </body
    </html>
    EOF
  end
end
