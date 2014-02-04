FactoryGirl.define do
  factory :user do
     sequence(:email) {|n| "user#{n}@email.com" }
     password '12345678'
   end

   factory :product do
     name "NAME"
     description "Description"
     price 10.0
   end

   factory :offer do
     name "Offer"
     description "Offer description"
     amount 0
     validity Time.now + 6.hours
     date Time.now
     association :product
   end

   factory :visited_offer do
     user_id   1
     offer_id  1
   end

end
