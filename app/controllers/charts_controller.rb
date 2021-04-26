class ChartsController < ApplicationController
  # Quitar al final
  skip_before_action :authenticate_user!

  def filter
  end

  def floors_second
    @searcher = ChartFilter.new

    floors = Floor.where(greenhouse_id: 3)

    render json: floors.map { |floor|
                   { name: floor.name,
                     data: floor.temperature_readings.group_by_day(:created_at, last: 7).average(:reading) }
                 }.chart_json
  end
end
