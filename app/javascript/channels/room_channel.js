import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the room!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected from the room!");
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data.content)
    $('#msg').append('<div class="message"> ' + data.content + '</div>')
  }
});

let submit_messages;
$(document).on('turbolinks:load', function () {
  submit_messages()
})
submit_messages = function () {
  $('#message_content').on('keydown', function (event) {
    if (event.keyCode == 13) {
      $('.submit').click()
      event.target.value = ''
      event.preventDefault()
    }
  })
}
