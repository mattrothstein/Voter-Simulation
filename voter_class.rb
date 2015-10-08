class Voter
  VOTER_TENDENCY = {
    t: 0.9,
    c: 0.75,
    n: 0.5,
    l: 0.25,
    s: 0.1
  }

  attr_accessor :name
  attr_accessor :political_affiliation

  def initialize (name, political_affiliation)
    @name = name
    @political_affiliation = political_affiliation
  end

  def update_name(name)
    @name = name
  end

  def update_politics(politics)
    @political_affiliation = politics
  end

  def vote (politicians = [])
    eligible_politicians = []
    if (rand < VOTER_TENDENCY[@political_affiliation])
      tendency =  :Rep
    else
       tendency = :Dem
    end

    eligible_politicians = politicians.select { |politician| politician.party_affiliation == tendency }

    unless eligible_politicians.empty?
      eligible_politicians.sample
    else
      politicians.sample
    end
  end
end
