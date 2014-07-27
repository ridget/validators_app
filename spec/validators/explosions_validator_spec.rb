require 'spec_helper'

# thanks @mattc
describe ExplosionsValidator do
  let(:klass) do
    Class.new do
      include ActiveModel::Validations
      attr_accessor :plot
      validates :plot, :explosions => {:message => "oh noes!"}
    end
  end

  subject { klass.new }

  context "is valid" do
    it do
      subject.plot = "boom bang end"
      subject.valid? # this executes the validators
      expect(subject.errors[:plot]).to be_empty
    end
  end

  context "is not valid" do
    it do
      subject.plot = "and then?"
      subject.valid? # this executes the validators
      expect(subject.errors[:plot]).to include("oh noes!")
    end
  end
end