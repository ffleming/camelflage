class TemplateInjection
  def initialize(string)
    @erb = ERB.new(interpolate(string))
  end

  def hint
    'The dog says "#{name}"'
  end

  def execute
    erb.result.html_safe
  end

  private

  def interpolate(string)
    <<-EOF.strip_heredoc
    <html><body><pre>
    +--------------------------------------+
    |                Hello, #{string}             |
    +--------------------------------------+
              \\
                .--~~,__
    :-....,-------`~~'._.'
    `-,,,  ,_      ;'~U'
      _,-' ,'`-__; '--.
    (_/'~~      ''''(;
    </pre></body></html>
    EOF
  end

  attr_reader :erb
end
