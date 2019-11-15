defmodule Countdown.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]
  alias Countdown.Repo

  schema "events" do
    field :due, :naive_datetime
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :due])
    |> validate_required([:title, :due])
  end

  def list_events do
    Repo.all(Event)
  end

  @doc """
   Returns the list of future events.

   ## Examples

       iex> list_future_events()
       [%Event{}, ...]

   """
    def list_future_events do
       query = from e in Countdown.Events.Event,
         where: e.due >= ^DateTime.utc_now
       Repo.all(query)
     end

end
