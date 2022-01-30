defmodule Lasagna do
  @expected_minutes_in_oven 40
  @expected_minutes_for_each_layer 2

  @doc """
  Returns the expected time in the oven
  """
  @spec expected_minutes_in_oven :: non_neg_integer()
  def expected_minutes_in_oven,
    do: @expected_minutes_in_oven

  @doc """
  Returns the remaining minutes in the oven
  """
  @spec remaining_minutes_in_oven(non_neg_integer()) :: non_neg_integer()
  def remaining_minutes_in_oven(actual_minutes)
      when is_integer(actual_minutes) and actual_minutes >= 0 do
    case actual_minutes <= @expected_minutes_in_oven do
      true ->
        expected_minutes_in_oven() - actual_minutes

      false ->
        0
    end
  end

  def remaining_minutes_in_oven(_actual_minutes),
    do: @expected_minutes_in_oven

  @doc """
  Returns the time to prepare the layers in Lasagna
  """
  @spec preparation_time_in_minutes(non_neg_integer()) :: non_neg_integer()
  def preparation_time_in_minutes(layer_count)
      when is_integer(layer_count) and layer_count >= 0 do
    layer_count * @expected_minutes_for_each_layer
  end

  def preparation_time_in_minutes(_layer_count),
    do: 0

  @doc """
  Returns the total time to cook the Lasagna
  """
  @spec total_time_in_minutes(non_neg_integer(), non_neg_integer()) :: non_neg_integer()
  def total_time_in_minutes(layer_count, actual_minutes)
      when is_integer(actual_minutes) and actual_minutes >= 0 do
    preparation_time_in_minutes(layer_count) + actual_minutes
  end

  def total_time_in_minutes(layer_count, _actual_minutes) do
    preparation_time_in_minutes(layer_count)
  end

  @doc """
  Returns the alarm message
  """
  @spec alarm() :: String.t()
  def alarm, do: "Ding!"
end
