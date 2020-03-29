class Pet 
  attr_accessor :name, :building, :url, :breed, :age, :weight, :gender
  attr_reader :cat
  @@all =[]
  def initialize(name,building,url)
    @name = name 
    @building  = building 
    @url = url 
    save
  end 
  
  def save 
    @@all <<self
  end 

  def self.all
    @@all
  end

  def cat=(cat)
    @@all.each do |pet|
      if pet.building == "Main Campus - Teen Cat Room" || pet.building == "Main Campus - Adult Cat Room" || pet.building == "Main Campus - Kittery" || pet.building == "Main Campus - Phat Camp" || pet.building == "Main Campus - ADL Hospital" 
        @cat = true
        @@all << pet
      else 
        @cat = false
        @@all << pet
      end
    end
  end
end 