require 'rails_helper'

RSpec.describe 'PostImageモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post_image.valid? }

    let(:user) { create(:user) }
    let!(:post_image) { build(:post_image, user_id: user.id) }


    context 'imageカラム' do
      it '画像未添付でないこと' do
        post_image.image = ''
        is_expected.to eq false
      end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(PostImage.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end


end
end

