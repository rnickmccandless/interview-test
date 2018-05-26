FactoryBot.define do
  factory :photo do
    image { Rack::Test::UploadedFile.new('spec/support/fixtures/test.jpg', 'image/png') }
    caption <<~HEREDOC
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt a neque non sagittis.
    HEREDOC
    user
  end
end
