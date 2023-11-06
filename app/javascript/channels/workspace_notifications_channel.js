import consumer from "./consumer"


consumer.subscriptions.create("WorkspaceNotificationsChannel", {
    received(data) {
        const messages = document.getElementById('messages');
        const messageElement = document.createElement('div');
        messageElement.innerText = data.message;
        messages.appendChild(messageElement);
    }
});