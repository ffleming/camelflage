# Simulates generating cryptographic hashes only when a user can be found,
# allowing an attacker to enumerate valid users
class ConditionalHashing
  def initialize(login, delta: max_delta)
    @login = login
    @delta = [max_delta, delta.to_f].min
  end

  # Return value is whether @login is valid
  def execute
    found = Camel.where(email: login).present?
    sleep(delta) if found
    found
  end

  def hint
    valid_logins
  end

  private

  attr_reader :login, :delta

  MAX_DELTA = 0.10

  def max_delta
    MAX_DELTA
  end
end
