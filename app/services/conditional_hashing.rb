# Simulates generating cryptographic hashes only when a user can be found,
# allowing an attacker to enumerate valid users
class ConditionalHashing
  def initialize(login, delta: max_delta)
    @login = login
    @delta = [max_delta, delta.to_f].min
  end

  # Return value is whether @login is valid
  def execute
    found = valid_logins.include?(login)
    sleep(delta) if found
    found
  end

  def hint
    valid_logins
  end

  private

  attr_reader :login, :delta

  MAX_DELTA = 0.20
  LOGINS = %w(charles@poodles.com camel@sahara.com bactrian@dev.null dromedary@dev.null).freeze

  def max_delta
    MAX_DELTA
  end

  def valid_logins
    LOGINS
  end
end
