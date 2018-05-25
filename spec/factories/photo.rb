FactoryBot.define do
  factory :photo do
    image { File.new("#{Rails.root}/spec/support/fixtures/test.jpg") }
    caption <<~HEREDOC
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt a neque non sagittis.
    HEREDOC
    user
  end
end
