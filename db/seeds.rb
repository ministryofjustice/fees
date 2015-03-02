# coding: utf-8

si = StatutoryInstrument.create!(title: 'The Civil Proceedings Fees (Amendment) Order 2014',
                                 coming_into_force: '2014-04-22')

FeeCategory.create!([
  {title: "Civil Claims", statutory_instrument_id: si.id},
  {title: "Bankruptcy", statutory_instrument_id: si.id},
  {title: "General Applications", statutory_instrument_id: si.id},
])

FeeType.create!([
  {fee_category_id: 1, title: "Entering a petition to declare yourself bankrupt (debtor’s petition)", amount: 180},
  {fee_category_id: 1, title: "Entering a petition to make someone who owes you money bankrupt (creditor’s petition)", amount: 280},
  {fee_category_id: 1, title: "Entering a winding-up petition (companies only)", amount: 280},
  {fee_category_id: 1, title: "Any other petition where no other fee is specified", amount: 280},
  {fee_category_id: 2, title: "High Court claim", amount: 480},
  {fee_category_id: 2, title: "County Court Claim", amount: 280},
  {fee_category_id: 2, title: "Possession Claims Online (PCOL)", amount: 250},
  {fee_category_id: 3, title: "Application on notice where no other fee is specified", amount: 150}
])
