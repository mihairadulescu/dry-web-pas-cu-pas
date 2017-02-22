Ingestellar::Transactions.define do |t|
  t.define 'main.transactions.fetch_entries' do
    step :fetch_entries, with: 'operations.fetch_entries'
  end
end
