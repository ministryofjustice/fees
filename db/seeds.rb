
AdminUser.create!(email: 'admin@example.com',
                  password: 'password',
                  password_confirmation: 'password')

si = StatutoryInstrument.create!(title: 'The Civil Proceedings Fees (Amendment) Order 2014',
                                 coming_into_force: '2014-04-22')

FeeCategory.create!([
                      {
                       title: "Starting proceedings (High Court and Court)",
                       statutory_instrument_id: si.id,
                       description: 'description',
                       fee_number: '1'
                      },
                    ])
