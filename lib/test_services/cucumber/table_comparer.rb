class TableComparer
  include Capybara::DSL
  attr_accessor :cucumber_table, :selector

  def initialize(cucumber_table, selector)
    @cucumber_table = cucumber_table
    @selector = selector
  end

  def matches?
    cucumber_table.diff!(table_to_2d_array).nil?
  end

private

  def table_to_2d_array
    page.find(selector).all("tr").map do |row|
      row.all("td,th").map { |cell| cell.text }
    end
  end
end