require 'rails_helper'

RSpec.describe Cat, type: :model do
  describe "Validations" do
    it "validates presence of name" do
      cat = build(:cat, name: nil)

      expect(cat.valid?).to be false
      expect(cat.errors[:name].present?).to be true
    end
  end

  describe "#followers association" do
    let(:cat) { create(:cat) }

    it "returns the list of visible cats that are followed by cat" do
      followed1 = create(:follower_relation, cat: cat)
      followed2 = create(:follower_relation, cat: cat)
      create(:follower_relation, cat: cat, followed: create(:cat, visible: false))

      expect(cat.followers.order("id ASC").all).to eq([followed1.followed, followed2.followed])
    end
  end

  describe "#followed_by association" do
    let(:cat) { create(:cat) }

    it "returns the list of visible cats that are following cat" do
      follower1 = create(:follower_relation, followed: cat)
      follower2 = create(:follower_relation, followed: cat)
      create(:follower_relation, cat: create(:cat, visible: false), followed: cat)

      expect(cat.followed_by.all).to eq([follower1.cat, follower2.cat])
    end
  end
  describe "Cats authoritation" do

    it "has a valid email" do
      cat = build(:cat, email:"cat@cats.com")
      expect(cat.valid?).to be true
      cat = build(:cat, email:"aedghh")
      expect(cat.valid?).to be false
    end
    it "returns error with empty password" do
      cat = build(:cat, password:"")
      expect(cat.valid?).to be false
    end
    it "returns valid when no empty password" do
      cat = build(:cat, password:"12453t3r")
      expect(cat.valid?).to be true
    end
  end
end
