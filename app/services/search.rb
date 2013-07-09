class Search
  def self.query(q, models)
    Array(models).inject([]) do |results, model|
      columns = model.columns_hash.select { |k, v| v.type == :string }.keys
      columns = columns.map { |column| "#{column} LIKE :search" }
      conditions = columns.join(" OR ")
      results << model.find(:all, conditions: [conditions, {search: "%#{q}%"}])
    end.flatten
  end
end
