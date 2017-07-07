class Van
  include BikeContainer

  def unload
    remove_bike
  end

  def load(bike)
    add_bike bike
  end

end
