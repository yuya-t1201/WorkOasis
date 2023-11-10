import consumer from "./consumer"


consumer.subscriptions.create("WorkspaceNotificationsChannel", {
    received(data) {
      return alert(data['message']);
    }
});