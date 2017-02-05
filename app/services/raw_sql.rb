class RawSql
  def initialize(name)
    @name = name
  end

  def execute
    ActiveRecord::Base.connection.execute(query).entries.inspect
  end

  def hint
    "SELECT * FROM camels WHERE name = '\#{name}'"
  end

  private

  attr_reader :name

  def query
    "SELECT * FROM camels WHERE name = '#{name}'"
  end
end
