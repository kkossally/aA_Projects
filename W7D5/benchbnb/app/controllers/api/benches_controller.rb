class Api::BenchesController < ApplicationController

  def index
    @benches = Bench.all
    # render 'api/benches/index'
  end

  def create
  end

end
