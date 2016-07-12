
# Create seed data for post

require 'random_data'


 50.times do

   Post.create!(

     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all



 # Create seed data for Comments; post has many comments

 100.times do
   Comment.create!(

     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end


 ##########
 15.times do

   Question.create!(

     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end

###########

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
######
  puts "#{Question.count} questions created"
