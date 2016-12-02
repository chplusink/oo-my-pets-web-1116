require "pry"

class Owner
  attr_accessor :name, :pets, :fishes, :dogs, :cats
  attr_reader :species

  @@all = []

  def self.all
    @@all
  end

  def initialize(species)
    @species = species
    @pets = {:fishes=>[],:dogs=>[],:cats=>[]}

    self.class.all << self
  end

  def self.all=(item)
    @@all = item
  end

  def self.reset_all
    self.all = []
  end

  def self.count
    @@all.length
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    self.pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets.each do |species,pets|
      pets.each {|pet| pet.mood = "nervous"}
    end
    self.pets = {:fishes=>[],:dogs=>[],:cats=>[]}
  end

  def list_pets
    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end


end
