require 'rails_helper'

RSpec.describe StatutoryInstrument, :type => :model do

  context 'validations' do

    context 'with all the attributes present' do
      let(:si) do
        StatutoryInstrument.new(title: 'The Civil Proceedings Fees (Amendment) Order 2014',
                                description: '',
                                coming_into_force: '2014-04-01')
      end

      it 'should be valid' do
        expect(si.valid?).to be true
      end
    end

    context 'title' do
      let(:si) do
        StatutoryInstrument.new(title: '',
                                coming_into_force: '2014-04-01')
      end

      it 'should require a title' do
        expect(si.valid?).to be false
      end
    end

    context 'coming_into_force' do
      let(:si) do
        StatutoryInstrument.new(title: 'The Civil Proceedings Fees (Amendment) Order 2014',
                                coming_into_force: '')
      end

      it 'should require a coming into force date' do
        expect(si.valid?).to be false
      end
    end
  end

  describe 'slug re-generation' do
    let(:si) do
      si = StatutoryInstrument.new(title: 'foo',
                                   description: '',
                                   coming_into_force: '2014-04-01')
      si.update(title: 'The Civil Proceedings Fees (Amendment) Order 2014')
      si
    end

    it 'should change the slug to match the new title' do
      expect(si.slug).to match 'the-civil-proceedings-fees-(amendment)-order-2014'
    end
  end
end
