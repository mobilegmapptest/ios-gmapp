window.native = {}

window.native.alert = function(message){window.webkit.messageHandlers.messageBox.postMessage({message:message});};
