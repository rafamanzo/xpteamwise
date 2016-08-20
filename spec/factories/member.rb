FactoryGirl.define do
  factory :member, class: XpTeamWise::Data::Member do
    sequence(:name) { |n| "Member #{n}" }
    sequence(:email) { |n| "member#{n}@member.com" }
    coach false
    projects []

    trait :coach do
      coach true
    end

    initialize_with { new(name: name, email: email, coach: coach, projects: projects) }
  end
end
