defmodule Pulap.Util.Time do
  epoch = {{1970, 1, 1}, {0, 0, 0}}
  @epoch :calendar.datetime_to_gregorian_seconds(epoch)

  def from_timestamp(timestamp) do
    timestamp
    |> Kernel.+(@epoch)
    |> :calendar.gregorian_seconds_to_datetime()
  end

  def to_timestamp(datetime) do
    datetime
    |> :calendar.datetime_to_gregorian_seconds()
    |> Kernel.-(@epoch)
  end

  def now_timestamp(:micro_seconds) do
    Ecto.DateTime.utc(:usec)
  end

  def sample_date_timestamp() do
    {{2099, 12, 21}, {23, 59, 0}} |> Ecto.DateTime.from_erl()
  end
end
