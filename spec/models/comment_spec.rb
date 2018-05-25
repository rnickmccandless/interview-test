require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'saves successfully' do
    comment = build :comment

    expect(comment.save).to eq true
  end

  it 'updates successfully' do
    comment = create :comment
    comment.comment = 'This is a changes comment'
    comment.save

    expect(comment.comment).to eq 'This is a changes comment'
  end

  it 'unable to save with empty comment' do
    comment = build :comment, comment: nil

    expect(comment.save).to eq false
  end

  it 'unable to save with more than 250 characters' do
    comment = build :comment, comment: 'c' * 251

    expect(comment.save).to eq false
  end
end
