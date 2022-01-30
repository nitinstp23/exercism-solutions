defmodule Rules do
  @doc """
  Returns true if power_pellet is active and is touching a ghost
  """
  @spec eat_ghost?(Boolean.t(), Boolean.t()) :: Boolean.t()
  def eat_ghost?(true = _power_pellet_active, true = _touching_ghost) do
    true
  end

  def eat_ghost?(_power_pellet_active, _touching_ghost),
    do: false

  @doc """
  Returns true if touching a power pellet or a dot
  """
  @spec score?(Boolean.t(), Boolean.t()) :: Boolean.t()
  def score?(true = _touching_power_pellet, _touching_dot),
    do: true

  def score?(_touching_power_pellet, true = _touching_dot),
    do: true

  def score?(_touching_power_pellet, _touching_dot),
    do: false

  @doc """
  Returns true if is touching a ghost and does not have a power pellet active
  """
  @spec lose?(Boolean.t(), Boolean.t()) :: Boolean.t()
  def lose?(false = _power_pellet_active, true = _touching_ghost),
    do: true

  def lose?(_power_pellet_active, _touching_ghost),
    do: false

  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) do
    # Please implement the win?/3 function
  end
end
