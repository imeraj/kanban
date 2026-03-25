defmodule KanbanWeb.PageController do
  use KanbanWeb, :controller

  @spec home(Plug.Conn.t(), map()) :: []
  def home(conn, _params) do
    render(conn, :home)
  end
end
