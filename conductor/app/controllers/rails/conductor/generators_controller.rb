# frozen_string_literal: true
require 'rails/generators'

class Rails::Conductor::GeneratorsController < Rails::Conductor::BaseController
  def index
    @generators = Rails::Generators.sorted_groups
  end

  def show
    @generator = Rails::Generators.find_by_namespace(params[:id])
  end

  def create
    @generator = Rails::Generators.find_by_namespace(params[:id])
    @generator.start(generator_params)
  end

  private

    def generator_params
      params.permit(:arguments)
    end
end
