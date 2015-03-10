# coding: utf-8
AdminUser.create!(email: 'admin@example.com',
                  password: 'password',
                  password_confirmation: 'password')

si = StatutoryInstrument.create!(title: 'The Civil Proceedings Fees (Amendment) Order 2014',
                                 coming_into_force: '2014-04-22')

FeeCategory.create!([{ title: "Starting proceedings (High Court and County Court)",
                       statutory_instrument_id: si.id,
                       description: 'Money Claims: Issue Fee',
                       fee_number: '1.1' }])

list_of_fees = [["a", "does not exceed £300", "35"],
                ["b", "exceeds £300 but does not exceed £500", "50"],
                ["c", "exceeds £500 but does not exceed £1,000", "70"],
                ["d", "exceeds £1,000 but does not exceed £1,500", "80"],
                ["e", "exceeds £1,500 but does not exceed £3,000", "115"],
                ["f", "exceeds 3,000 but does not exceed 5,000", "205"],
                ["g", "exceeds 5,000 but does not exceed 15,000", "455"],
                ["h", "exceeds 15,000 but does not exceed 50,000", "610"],
                ["i", "exceeds 50,000 but does not exceed 100,000", "910"],
                ["j", "exceeds 100,000 but does not exceed 150,000", "1115"],
                ["k", "exceeds 150,000 but does not exceed 200,000", "1315"],
                ["l", "exceeds 200,000 but does not exceed 250,000", "1515"],
                ["m", "exceeds 250,000 but does not exceed 300,000", "1720"],
                ["n", "exceeds £300,000 or is not limited.", "1920"]]

category = FeeCategory.first

list_of_fees.each do |fee|
  FeeType.create!(fee_category_id: category.id,
                  fee_number: fee[0],
                  title: fee[1],
                  amount: fee[2])
end
