class Population
  attr_accessor :voters
  attr_accessor :politicians

  def initialize
    @voters = []
    @politicians = []
  end

  def add_voter (voter)
    @voters.push(voter)
  end

  def add_politician (politician)
    @politicians.push(politician)
  end
end
