window.native = {}

window.native.alert = function(message){window.webkit.messageHandlers.native.postMessage({message:message});};
