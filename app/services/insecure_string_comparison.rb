# Performs insecure string comparison, wherein the first non-matching byte
# causes an early return.
class InsecureStringComparison
  def initialize(candidate, delta: max_delta, against: BITSTREAM)
    @delta = [max_delta, delta.to_f].min
    @candidate = candidate.to_s.bytes
    @bitstream = against.to_s
  end

  def execute
    bitstream.each_byte.with_index do |byte, i|
      return false unless byte == candidate[i]
      sleep delta
    end
    return false unless bitstream.length == candidate.length
    true
  end

  def hint
    bitstream
  end

  private

  BITSTREAM = <<-STRING.strip_heredoc.tr("\n", " ").strip.freeze
    I turn my body from the sun. What ho, Tashtego! let me hear thy hammer.  Oh!
    ye three unsurrendered spires of mine; thou uncracked keel; and only
    god-bullied hull; thou firm deck, and haughty helm, and Pole-pointed prow,
    -- death-glorious ship! must ye then perish, and without me? Am I cut off from
    the last fond pride of meanest shipwrecked captains? Oh, lonely death on
    lonely life! Oh, now I feel my topmost greatness lies in my topmost grief.
    Ho, ho! from all your furthest bounds, pour ye now in, ye bold billows of my
    whole foregone life, and top this one piled comber of my death! Towards thee
    I roll, thou all-destroying but unconquering whale; to the last I grapple
    with thee; from hell's heart I stab at thee; for hate's sake I spit my last
    breath at thee. Sink all coffins and all hearses to one common pool! and
    since neither can be mine, let me then tow to pieces, while still chasing
    thee, though tied to thee, thou damned whale! THUS, I give up the spear!
  STRING

  MAX_DELTA = 0.05

  def max_delta
    MAX_DELTA
  end
  attr_reader :candidate, :delta, :bitstream
end
