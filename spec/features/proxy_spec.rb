RSpec.feature 'proxy', type: :feature do
  let(:user) { create(:user) }
  let(:second_user) { create(:user) }

  describe 'add proxy in profile', :js do
    it "creates a proxy" do
      sign_in user
      click_link "Your activity"
      click_link "Profile"
      click_link "Edit Profile"
      expect(first("td.depositor-name")).to be_nil
      create_proxy_using_partial(second_user)
      expect(page).to have_css('td.depositor-name', text: second_user.user_key)
    end
  end
end
