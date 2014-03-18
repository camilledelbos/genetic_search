class MainController < ApplicationController
# require '/lib/genetic_algorithm.rb'
# require '/lib/data_set.rb'

def index
data_filename = "#{File.dirname(__FILE__)}/travel_cost.csv"

@data_set = Ai4r::Data::DataSet.new.load_csv_with_labels data_filename
@data_set.data_items.collect! {|column| column.collect {|element| element.to_f}}

Ai4r::GeneticAlgorithm::Chromosome.set_cost_matrix(@data_set.data_items)

3.times do
    @c = Ai4r::GeneticAlgorithm::Chromosome.seed
  end

search = Ai4r::GeneticAlgorithm::GeneticSearch.new(800, 100)
@result = search.run

end


end
