defmodule CountdownWeb.PageControllerTest do
  use CountdownWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "[<:F41BBB7A9940C3967F98E2B69C37A15E:>]"
  end
end
