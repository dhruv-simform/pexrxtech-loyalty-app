# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPoint, type: :model do
  context 'user points' do
    let(:user_point) { create(:user_point) }
    it 'should not expire before end of year' do
      user_point.point_expired_every_year
      expect(UserPoint.exists?(user_point.id)).to be true
    end

    it 'should expire previous year points' do
      user_point.update(created_at: Time.now - 1.year + 1.day)
      user_point.point_expired_every_year
      expect(UserPoint.exists?(user_point.id)).to be false
    end
  end
end
