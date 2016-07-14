
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

 # Create or find a unique record in the seeds data

 begin

   Post.find_or_create_by(title: "Final try at Unique record in post to test idempotence",

              body: "Final try on the test of the seed data for idempotence")

   Comment.where(post: "Final try at Unique record in post to test idempotence").first_or_create(body: "Seed data for idempotence test")


 rescue ActiveRecord::RecordNotUnique


 end


 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
