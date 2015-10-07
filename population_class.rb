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

  def update_voter (search_name, new_name, new_political_affiliation)
    @voters.each do |x|
      if x.name == search_name
         x.update_name(new_name)
         x.update_politics(new_political_affiliation)
      end
    end
  end

  def update_politician (search_name, new_name, new_party_affiliation)
    @politicians.each do |x|
      if x.name == search_name
        x.update_name(new_name)
        x.update_party(new_party_affiliation)
      end
    end
  end

end
