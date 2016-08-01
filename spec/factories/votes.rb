

FactoryGirl.define do

  factory :vote do
    value RandomData.random[-1,1].sample
  end

 end
