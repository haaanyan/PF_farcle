class User::HomesController < ApplicationController
  def top; end

  def guest_sign_in
    user = User.find_by!(email: 'test_user1@test.com') do |user|
      user.password = "password"
    end
    sign_in user
    redirect_to user_path(user), notice: 'ゲストユーザーとしてログインしました。'
  end
end
