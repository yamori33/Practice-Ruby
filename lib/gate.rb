# Class representing ticket gate
class Gate
  STATIONS = [:umeda, :juso, :mikuni]
  FARES = [150, 190]

  # Create Gate object
  # ==== argument
  # * +name+ - station name
  def initialize(name)
    @name = name
  end

  # Enter the station through the ticket gate
  # ==== argument
  # * +ticket+ - ticket
  def enter(ticket)
    ticket.stamp(@name)
  end

  # Exit the station through the ticket gate
  # ==== argument
  # * +ticket+ - ticket
  # ==== return value
  # * +boolean+ - +true+ if the fare is enough, +false+ if the fare is not enough
  def exit(ticket)
    fare = calc_fare(ticket)
    fare <= ticket.fare
  end

  def calc_fare(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)
    distance = to - from
    FARES[distance - 1]
  end
end
