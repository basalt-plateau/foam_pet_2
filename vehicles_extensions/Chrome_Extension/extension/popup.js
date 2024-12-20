
document.getElementById('changeColor').addEventListener('click', function () {
  // Get the current tab and change its background color
  chrome.tabs.query({ active: true, currentWindow: true }, function (tabs) {
    chrome.scripting.executeScript({
      target: { tabId: tabs[0].id },
      func: changeBackgroundColor
    });
  });
});

function changeBackgroundColor() {
  document.body.style.backgroundColor = 'lightblue';
}
