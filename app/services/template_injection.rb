class TemplateInjection
  def initialize(string)
    @erb = ERB.new(interpolate(string))
  end

  def hint
    'The dog says "#{name}"'
  end

  def execute
    erb.result
  end

  private

  def interpolate(string)
    <<-EOF.strip_heredoc
    +--------------------------------------+
    |                Hello, #{string}             |
    +--------------------------------------+
              \\
                .--~~,__
    :-....,-------`~~'._.'
    `-,,,  ,_      ;'~U'
      _,-' ,'`-__; '--.
    (_/'~~      ''''(;
    EOF
  end

  attr_reader :erb
end
