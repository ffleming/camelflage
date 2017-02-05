# Joe ' OR 1=1--)
class RawWhere
  def initialize(name)
    @name = name
  end

  def execute
    Camel.where(where_query).inspect
  end

  def hint
    [ "Camel.where(where_query)",
      "name = '\#{name}'", ]
  end

  private

  attr_reader :name

  def where_query
    "name = '#{name}'"
  end
end
