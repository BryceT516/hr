require "rails_helper"

RSpec.describe "Create Assessment", type: :feature do
  describe "#create" do
    let(:hr) { create :user, :hr }
    let(:middle_dev) { create :user, :middle_dev }

    context "when user is hr" do
      before { login_as hr }

      it "hr creates assessment" do
        visit new_user_assessment_path(middle_dev)

        select "Senior Developer", from: "assessment[requested_role]"
        click_button "Сохранить"

        expect(page).to have_content(Time.zone.today.strftime("%e %B %Y"))
      end
    end

    context "when user is middle_dev" do
      before { login_as middle_dev }

      it "middle_dev creates assessment" do
        visit new_user_assessment_path(hr)

        expect(page).to have_content "Извините, запрошенная функция недоступна."
      end

      it "middle_dev creates assessment for heself" do
        visit new_user_assessment_path(middle_dev)

        expect(page).to have_content "Извините, запрошенная функция недоступна."
      end
    end
  end
end
