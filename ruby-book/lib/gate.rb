# frozen_string_literal: true

class Gate
  STATIONS = %i[umeda juso mikuni].freeze
  FARES = [150, 190].freeze

  def initialize(name)
    @name = name
  end

  def calc_fare(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)
    distance = to - from
    FARES[distance - 1]
  end

  def enter(ticket)
    ticket.stamp(@name)
  end

  def exit(ticket) # rubocop:disable Naming/PredicateMethod
    fare = calc_fare(ticket)
    fare <= ticket.fare
  end
end
