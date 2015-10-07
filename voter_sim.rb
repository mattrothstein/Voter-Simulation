require "./voter_class.rb"
require "./population_class.rb"
require "./politician_class.rb"
require "./election_class.rb"
#require "pry-byebug"
# include Voter
# include Population
# include Politician
# include Election


class UserInterface
  attr_accessor :pop

  def initialize (pop)
    @pop = pop
  end

  def main_menu
    puts "What would you like to do?"
    puts "(C)reate, (L)ist, (U)pdate, (V)ote or (E)xit."
    response = validator(gets.chomp.downcase, ["c","l","u","v","e"])
    main_menu unless response
    main_menu_choice(response)
  end

  def main_menu_choice(response)
    case response
      when "c"
        create
      when "l"
        list
      when "u"
        update
      when "v"
        vote
      else
        puts"Good Bye!"
        exit
    end
  end

  def create
    puts "What would you like to create?"
    puts "(P)olitician or (V)oter"
    response = validator(gets.chomp.downcase, ["p", "v"])
    create unless response
      if response == "p"
        new_politician
      else
        new_voter
      end
  end

  def new_voter
    puts "Name ?"
    name = gets.chomp
    response = voter_affiliation
    @pop.add_voter(Voter.new(name, response))
    main_menu
  end

  def voter_affiliation
    puts "Party?"
    puts "(T)ea Party, (C)onservative, (N)ueatral, (L)iberal, (S)ocialist"
    response = validator(gets.chomp.downcase, ["t","c","n","l","s"])
    voter_affiliation unless response
    response.to_sym
  end

  def new_politician
    puts "Name?"
    name = gets.chomp
    response = politician_affiliation
      if response == "d"
        @pop.add_politician(Politician.new(name, :Dem))
      else
        @pop.add_politician(Politician.new(name, :Rep))
      end
    main_menu
  end

  def politician_affiliation
    puts "Party?"
    puts "(D)emocrat or (R)epublican"
    response = validator(gets.chomp.downcase, ["d", "r"])
    politician_affiliation unless response
    response
  end

  def list
    puts "POLITICIANS"
    @pop.politicians.each do |object|
      puts "#{object.name} #{object.party_affiliation}"
    end
    puts "REGISTERED VOTERS"
    @pop.voters.each do |object|
      puts "#{object.name} #{object.political_affiliation.upcase}"
    end
    main_menu
  end

  def vote
    election = Election.new(@pop)
    election.poll
    main_menu
  end

  def update
     puts "Would you like to Update a (V)oter or a (P)olitician?"
     response = validator(gets.chomp.downcase, ["p", "v"])
     update unless response
       if response == "p"
         update_politician
       else
         update_voter
       end
     main_menu
  end

  def update_voter
    puts "Name?"
    search_name = gets.chomp.downcase
    @pop.voters.each do |x|
      if x.name == search_name
        puts "Found #{search_name}. Please enter new information now."
        puts "Name ?"
        name = gets.chomp
        response = voter_affiliation
        @pop.update_voter(search_name, name, response)
      end
    end
  end

  def update_politician
    puts "Name?"
    search_name = gets.chomp.downcase
    @pop.politicians.each do |x|
      if x.name == search_name
        puts "Found #{search_name}. Please enter new information now."
        puts "Name ?"
        name = gets.chomp
        response = politician_affiliation
        @pop.update_politician(search_name, name, response)
      end
  end
end

  def validator(user_response, valid_response)
    if valid_response.include? user_response
       user_response
    else
       nil
    end
  end

end

pop = Population.new
game = UserInterface.new(pop)
game.main_menu
