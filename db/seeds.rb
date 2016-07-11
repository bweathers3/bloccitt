
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

########   Create seed data for advertisement

12.times do

  Advertisement.create!(

    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    #price:  RandomData.random_integer
  )
end
advertisements = Advertisement.all


########

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 ##
 puts "#{Advertisement.count} advertisements created"
