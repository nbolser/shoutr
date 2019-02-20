class Search
  # include ActiveModel::Conversion
  # extend  ActiveModel::Naming

  attr_reader :term

  def initialize(term:)
    @term = term
  end

  def run
    ShoutSearchQuery.new(term: term).to_relation
  end

  alias results run
end
