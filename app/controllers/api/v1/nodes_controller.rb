class Api::V1::NodesController < ApplicationController
  def index
    render json: Node.all
  end
end
