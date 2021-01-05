
require 'pry'
require 'nokogiri'
require 'open-uri'

class Yogascrape::Scraper
  
  def self.scrape_class
    title_array=[]
    length_array=[]
    diff_array=[]
    url_array =[]
    doc = Nokogiri::HTML(open("https://www.doyogawithme.com/yoga-classes?field_difficulty_value=All&field_minutes_value=All&field_class_style_value=All&field_teacher_entity_target_id=8&Submit=Apply"))
   
   title_array = self.get_titles(doc,title_array)
   
   length_array=self.get_lengths(doc,length_array)
  
   diff_array=self.get_difficulty(doc,diff_array)
   url_array=self.get_url(doc, url_array)
   
   i=1
   while i<=5 do
     
   doc = Nokogiri::HTML(open("https://www.doyogawithme.com/yoga-classes?field_difficulty_value=All&field_minutes_value=All&field_class_style_value=All&field_teacher_entity_target_id=8&Submit=Apply&page=#{i}"))
     title_array = self.get_titles(doc,title_array)
     length_array=self.get_lengths(doc,length_array)
     diff_array=self.get_difficulty(doc,diff_array)
     url_array=self.get_url(doc, url_array)
     i+=1
   end
   self.arrays_to_objects(title_array,diff_array,length_array,url_array)
   
 end
  
  def self.get_titles(doc, title_array)
    titles = doc.css("#block-system-main").css(".video-info h3")
    
    titles.each do |title|
      title_array << title.text
    end
    title_array
  end 
  
  def self.get_lengths(doc, length_array)
    lengths = doc.css("#block-system-main").css(".field-name-field-minutes")
    
    lengths.each do |length|
    
      length_array << length.text
    end
    length_array
  end

   def self.get_difficulty(doc, diff_array)
    diffs = doc.css("#block-system-main").css(".field-difficulty")
    
    diffs.each do |diff|
      diff_array << diff.text
    end
    diff_array
  end
  
  def self.get_url(doc, url_array)
    urls = doc.css("span.field-content a")
    
    urls.each do |url|
      
      url_array<< url.attr("href")
    end
    url_array
  end
  def self.arrays_to_objects(title_array,diff_array,length_array,url_array)
    i=0
    while i<= title_array.length-1
    Yogascrape::Yogaclass.new(title_array[i],diff_array[i],length_array[i],url_array[i])
    i+=1
    end 
  end
end

