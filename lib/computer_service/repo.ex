defmodule ComputerService.Repo do
  use Ecto.Repo,
    otp_app: :computer_service,
    adapter: Ecto.Adapters.Postgres
end
