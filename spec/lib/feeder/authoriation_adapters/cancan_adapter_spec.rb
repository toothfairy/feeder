require "spec_helper"

describe Feeder::AuthorizationAdapters::CanCanAdapter do
  let(:user) { create :user }
  let(:item) { create :feeder_item }

  subject do
    described_class.new user
  end

  context "configured" do
    before { subject.cancan_ability_class = "Foo" }

    it "should change the its ability class" do
      expect(subject.cancan_ability_class).to eq "Foo"
    end
  end

  context "unconfigured" do
    it "should default the its ability class" do
      expect(subject.cancan_ability_class).to eq "Ability"
    end
  end

  context "authorized" do
    before do
      expect(subject.cancan_ability).to receive(:can?).with(:manage, item).and_return(true)
    end

    it "should authorize" do
      expect(subject).to be_authorized(:manage, item)
    end
  end

  context "unauthorized" do
    before do
      expect(subject.cancan_ability).to receive(:can?).with(:manage, item).and_return(false)
    end

    it "should not authorize" do
      expect(subject).not_to be_authorized(:manage, item)
    end
  end
end
