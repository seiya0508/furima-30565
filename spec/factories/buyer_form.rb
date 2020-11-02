FactoryBot.define do
  factory :buyer_form do

    token {"tok_abcdefghijk00000000000000000"}
    postal_code {'123-4567'}
    prefecture_id {1}
    municipality {'函館'}
    address {1-1-1}
    tel {'09011112222'}
  end
end   
