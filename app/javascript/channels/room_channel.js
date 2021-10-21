import consumer from "./consumer"
var user_id = $('#current_user').data('user-id');
consumer.subscriptions.create({channel: "RoomChannel", room_id: user_id}, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log(`Connected to the room ${user_id}!`);
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log(`Disconnected from room ${user_id}!`);
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    add_notification(data.message)
    update_notification_count()
  }
});

let submit_messages;
let update_notification_count;
let add_notification;

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

update_notification_count = function(){
  var count = $('#notification-list').find('.message').length
  $('#notification-count').html(count)
}

add_notification = function(msg) {
  $('#notification-list').append(`
    <li class='message'>
      <p>${msg}<p>
    </li>
  `)
}
