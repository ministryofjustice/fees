# coding: utf-8
AdminUser.create!(email: 'admin@example.com',
                  password: 'password',
                  password_confirmation: 'password')

si = StatutoryInstrument.create!(title: 'The Civil Proceedings Fees (Amendment) Order 2014',
                                 coming_into_force: '2014-04-22')

category = FeeCategory.create!(title: "Starting proceedings (High Court and County Court)",
                               statutory_instrument_id: si.id,
                               description: 'Money Claims: Issue Fee',
                               fee_number: '1.1')


fee = FeeType.create!(fee_category_id: category.id,
                fee_number: '1.1',
                title: 'On starting proceedings to recover a sum of money where the sum claimed',
                description: 'Money Claims: Issue Fee')

bands = [['a', '0', '300', '35'],
         ['b', '300', '500', '50'],
         ['c', '500', '1000', '70'],
         ['d', '1000', '1500', '80'],
         ['e', '1500', '3000', '115'],
         ['f', '3000', '5000', '205'],
         ['g', '5000', '15000', '455'],
         ['h', '15000', '50000', '610'],
         ['i', '50000', '100000', '910'],
         ['j', '100000', '150000', '1115'],
         ['k', '150000', '200000', '1350'],
         ['l', '200000', '250000', '1515'],
         ['m', '250000', '300000', '1720'],
         ['n', '300000', 'unlimited', '1920']]

bands.each do |band|
  BandedFee.create!(fee_type_id: fee.id,
                    fee_number: band[0],
                    from_amount: band[1],
                    to_amount: band[2],
                    amount: band[3])
end

# A sample flat fee

land_recovery = FeeCategory.create!(title: "On starting proceedings for the recovery of land",
                                    statutory_instrument_id: si.id,
                                    description: 'Recovery of Land: Issue Fee',
                                    fee_number: '1.4')

land_recovery_fee = FeeType.create!(fee_category_id: land_recovery.id,
                                    fee_number: '1.4',
                                    title: 'in the High Court',
                                    description: 'another fee')

FlatFee.create!(fee_type_id: land_recovery_fee.id,
                fee_number: 'a',
                amount: '480')
