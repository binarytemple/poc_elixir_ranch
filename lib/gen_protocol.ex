defmodule PocElixirRanch do

  use Application
	alias PocElixirRanch.GenProtocol

	def start(_type, _args) do
		IO.puts "Starting PocElixirRanch"
  #    # Import helpers for defining supervisors
  #    import Supervisor.Spec
  #    children = [
  #      worker(GenProtocol,[])
  #    ]
  #    # Start the supervisor with our one child
  #    {:ok, pid} = Supervisor.start_link(children, strategy: :one_for_one)
		start_link()
  end

  def start_link() do
    :ranch.start_listener( make_ref(), :ranch_tcp, [{:port, 5555}], GenProtocol, [])
  end

end

