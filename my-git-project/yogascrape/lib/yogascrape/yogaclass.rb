class Yogascrape::Yogaclass
  require 'pry'
  attr_accessor :name, :difficulty, :length, :url
  @@all = []
  def initialize (name,difficulty,length,url)
    @name = name
    @difficulty = difficulty
    @length = length
    @url = url
    @@all << self
  end
  
  Yogascrape::Scraper.scrape_class
  
  def self.screen_by_input(diff,l)
    array_limits=[[0,20],[20,30],[30,50],[50,120]]
    array_diff=["Beginner I","Intermediate I","Intermediate II","Intermediate III","Advanced"]
    sorted=[]
    @@all.each do |yogaclass|
      if yogaclass.difficulty == array_diff[diff-1] && yogaclass.length.to_i >= array_limits[l-1][0] && yogaclass.length.to_i <= array_limits[l-1][1]
        sorted << yogaclass
      end
    end
    sorted
  end
    
    
    
end