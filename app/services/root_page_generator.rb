require 'github/markup'
class RootPageGenerator
  def initialize(readme:   Rails.root.join("README.md"),
                 template: Rails.root.join("root_template.html.erb"),
                 outfile:  Rails.root.join("public", "index.html") )
    @readme = readme
    @template = template
    @outfile = outfile
  end

  def markdown
    @markdown ||= File.read(readme)
  end

  def markdown_html
    @markdown_html ||= GitHub::Markup.render(readme, markdown)
  end

  def erb_renderer
    @erb_renderer ||= ERB.new(template)
  end
    # File.write(Rails.root.join("public", "index.html"), final_html)

  private

  attr_reader :readme, :template, :outfile
end
