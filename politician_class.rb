class Politician < Voter
  attr_accessor :party_affiliation
  attr_accessor :name

  def initialize(name, party_affiliation)
    @name = name
    @party_affiliation = party_affiliation
  end

  def vote(*_)
    self
  end

  def update_name(name)
    @name = name
  end

  def update_party(party)
    @party_affiliation = party
  end
end
