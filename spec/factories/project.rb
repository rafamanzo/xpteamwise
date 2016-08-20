FactoryGirl.define do
  factory :project, class: XpTeamWise::Data::Project do
    sequence(:name) { |n| "Project #{n}" }

    initialize_with { new(name: name) }
  end
end
