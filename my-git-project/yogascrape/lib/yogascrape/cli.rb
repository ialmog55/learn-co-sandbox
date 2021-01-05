class Yogascrape::CLI
  def call
    
     input1 = choose_difficulty
     until [1,2,3,4,5].include?(input1)
       input1 = choose_difficulty
      end 
      input2 = choose_length
     until [1,2,3,4].include?(input2)
       input2 = choose_length
      end 
     class_list = Yogascrape::Yogaclass.screen_by_input(input1,input2)
     
     puts "Here are Yoga classes you can watch"
     class_list.each do |yogaclass|
       puts "#{yogaclass.name} at doyogawithme#{yogaclass.url}"
      
     end
  end   
    

  def choose_difficulty
     puts "Choose 1 to 5 level of difficulty
            1.Beginner
            2.Intermediate I
            3.Intermediate II
            4.Intermediate III
            4.advanced"
       gets.strip.to_i
  end
  def choose_length
    
     puts "Choose 1 to 4 length of class
            1.under 20 minutes 
            2.20-30 minutes
            3.30-50 minutes
            4.over 50 minutes"
     gets.strip.to_i
  end
  
 
  
end