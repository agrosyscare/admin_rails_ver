module Admin
  class ChartsController < AdminController
    def temperatures
      floors = Floor.where(greenhouse_id: params[:value])

      render json: floors.map { |floor|
                     { name: floor.name,
                       data: floor.temperature_readings.group_by_day(:created_at, last: 7).average(:reading) }
                   }.chart_json
    end

    def humidities
      floors = Floor.where(greenhouse_id: params[:value])

      render json: floors.map { |floor|
                     { name: floor.name,
                       data: floor.humidity_readings.group_by_day(:created_at, last: 7).average(:reading) }
                   }.chart_json
    end

    def root_moistures
      floors = Floor.where(greenhouse_id: params[:value])

      render json: floors.map { |floor|
                     { name: floor.name,
                       data: floor.root_moisture_readings.group_by_day(:created_at, last: 7).average(:reading) }
                   }.chart_json
    end
  end
end
