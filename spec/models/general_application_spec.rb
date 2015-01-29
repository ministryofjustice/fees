require 'rails_helper'

RSpec.describe GeneralApplication, :type => :model do

  context 'validations' do
    before(:each) { application.valid? }

    describe 'correct general application' do
      let(:application) do
        GeneralApplication.new(title: 'application1',
                               fee: '1')
      end

      it 'should be valid' do
        expect(application).to be_valid
      end
    end

    describe '#title' do
      context 'when only the title is present' do
        let(:application) { GeneralApplication.new(title: 'application1') }

        it 'should not be valid' do
          expect(application).to_not be_valid
        end
      end
    end

    describe '#fee' do
      context 'when only the fee is present' do
        let(:application) { GeneralApplication.new(fee: '1') }

        it 'should not be valid' do
          expect(application).to_not be_valid
        end
      end
    end
  end

  describe 'slug generation' do
    before { GeneralApplication.create!(title: 'application1', fee: '1') }

    let(:last_entry) { GeneralApplication.last }
    let(:friendly) { GeneralApplication.friendly.find('application1') }

    it 'should find the general application based on the slug id' do
      expect(last_entry).to eq friendly
    end
  end

  describe 'slug modification' do
    let(:application) do
      application = GeneralApplication.create!(title: 'foo', fee: '1')
      application.update(title: 'foo bar')
      application
    end

    it 'should change the slug to match the new title' do
      expect(application.slug).to match 'foo-bar'
    end
  end

  describe 'history' do
    before do
      GeneralApplication.create!(title: 'foo', fee: '1')
      GeneralApplication.friendly.find('foo').update(title: 'foo bar baz')
    end

    it 'should point to the same model after title change' do
      expect {
        GeneralApplication.friendly.find('foo')
      }.not_to raise_error
    end
  end
end
