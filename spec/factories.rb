FactoryGirl.define do
  factory :user do
     sequence(:email) {|n| "user#{n}@email.com" }
     password '12345678'
     authentication_token '123456ASDZXC'
   end

   factory :category_establishment do
     name 'Serviços'
   end

   factory :establishment do
     name 'Establishment'
     surname 'Establishment Surname'
     phone '(55) 87878787'
     sequence(:email) {|n| "establishment#{n}@email.com" }
     password '123456'
     cnpj  '123456'
     reason 'Ifollow'
     city_id 1
     plan_id 1
     imageprofile 'logo.png'

     association :category_establishment
   end

   factory :address_establishment do
     address 'Rua Dom Aquino, 2045 Sala 04'
     latitude  -20.4603
     longitude -20.4603

     association :establishment
   end

   factory :product do
     name "NAME"
     description "Description"
     price 10.0
   end

   factory :offer do
     name "Offer"
     description "Offer description"
     amount 10
     validity Time.now + 6.hours
     date Time.now

     association :establishment
     association :product
   end

   factory :visited_offer do
     user_id   1
     offer_id  1
   end

end
