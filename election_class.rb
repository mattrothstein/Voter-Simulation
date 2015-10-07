class Election
  attr_accessor :votes

  def initialize (population)
    @population = (population.politicians) + (population.voters)
    @pop = population
  end

  def most_common_value(a)
    a.group_by do |e|
      e
    end.values.max_by(&:size).first
  end

  def poll
    @votes = {}

    @pop.politicians.each do |politician|
      @votes[politician.name] = 0
    end

    @population.each do |person|
      politician = person.vote(@pop.politicians)
      votes[politician.name] += 1
    end

    if @votes == {}
      puts  "No one has voted"
    else
      puts @votes
    end
  end
end
