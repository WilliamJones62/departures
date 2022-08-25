class Api::V1::DeparturesController < ApplicationController
  def index
    @departures = Departure.where(confirmed: false).or(Departure.where(confirmed: true).where('confirmed_time > ?', Time.current - 5.minutes))
  end
end
