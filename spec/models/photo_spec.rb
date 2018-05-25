require 'rails_helper'

RSpec.describe Photo, type: :model do
  it 'saves successfully' do
    photo = build :photo

    expect(photo.save).to eq true
  end

  it 'updates successfully' do
    photo = create :photo
    photo.caption = 'This is a changes comment'

    expect(photo.save).to eq true
    expect(photo.caption).to eq 'This is a changes comment'
  end

  it 'destroys successfully' do
    photo = create :photo

    expect(photo.destroy).to eq photo
  end

  it 'unable to save with empty caption' do
    photo = build :photo, caption: nil

    expect(photo.save).to eq false
  end

  it 'unable to save with empty image' do
    photo = build :photo, image: nil

    expect(photo.save).to eq false
  end

  it 'unable to save with more than 250 characters' do
    photo = build :photo, caption: 'c' * 251

    expect(photo.save).to eq false
  end
end