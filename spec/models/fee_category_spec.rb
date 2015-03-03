require 'rails_helper'

RSpec.describe FeeCategory, :type => :model do
  context 'validations' do
    context 'with the title' do
      let(:category) do
        FeeCategory.new(statutory_instrument_id: 1,
                        title: 'some category',
                        description: 'description')
      end

      it 'should be valid' do
        expect(category).to be_valid
      end
    end

    context 'without the title' do
      it 'should not be valid' do
        expect(FeeCategory.new).to_not be_valid
      end
    end

    context 'description' do
      context 'without the description' do
        let(:category) do
          FeeCategory.new(statutory_instrument_id: 1,
                          title: 'some category')
        end

        it 'should not be valid' do
          expect(category).to_not be_valid
        end
      end
    end
  end

  describe 'slug generation' do
    before do
      FeeCategory.create!(title: 'general',
                          statutory_instrument_id: 1,
                          description: 'description')
    end

    let(:fee) { FeeCategory.where(title: 'general').first }
    let(:friendly_fee) { FeeCategory.friendly.find('general') }

    it 'should find the general application based on the slug id' do
      expect(fee).to eq friendly_fee
    end
  end

  describe 'slug re-generation' do
    let(:category) do
      category = FeeCategory.create!(title: 'foo',
                                     statutory_instrument_id: 1,
                                     description: 'description')
      category.update(title: 'foo bar')
      category
    end

    it 'should change the slug to match the new title' do
      expect(category.slug).to match 'foo-bar'
    end
  end
end
