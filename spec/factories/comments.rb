FactoryBot.define do
  factory :comment do
    comment <<~HEREDOC
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt a neque non sagittis.
    HEREDOC
    rating 1
    user
    photo
  end
end
