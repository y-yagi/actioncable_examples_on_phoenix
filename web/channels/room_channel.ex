defmodule ActioncableExamples.RoomChannel do
  use Phoenix.Channel

  def join("rooms:lobby", _message, socket) do
    {:ok, socket}
  end
  def join("rooms:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    message = ActioncableExamples.Repo.get(ActioncableExamples.Message, 3)
    user = ActioncableExamples.Repo.get(ActioncableExamples.User, message.user_id)
    ActioncableExamples.Repo.insert(%ActioncableExamples.Comment{content: body, message_id: message.id, user_id: user.id})

    broadcast! socket, "new_msg", %{body: body}
    {:noreply, socket}
  end

  def handle_out("new_msg", payload, socket) do
    push socket, "new_msg", payload
    {:noreply, socket}
  end
end
