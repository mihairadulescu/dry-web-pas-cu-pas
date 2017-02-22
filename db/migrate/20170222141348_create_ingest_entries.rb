ROM::SQL.migration do
  change do create_table :ingest_entries do
      primary_key :id
      String :email, null: false, unique: false
    end
  end
end
