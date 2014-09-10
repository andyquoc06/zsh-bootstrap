var fullscreen, right, left, topLeft, bottomLeft, topRight, bottomRight;

fullscreen = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: 'screenSizeX',
  height: 'screenSizeY'
});

right = slate.operation('move', {
  x: 'screenSizeX / 2',
  y: 'screenOriginY',
  width: 'screenSizeX / 2',
  height: 'screenSizeY'
});

left = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: 'screenSizeX / 2',
  height: 'screenSizeY'
});

topLeft = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: 'screenSizeX / 2',
  height: 'screenSizeY / 2'
});

topLeftThird = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: 'screenSizeX / 2',
  height: 'screenSizeY / 3'
});

midLeftThird = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenSizeY * .33',
  width: 'screenSizeX / 2',
  height: 'screenSizeY / 3'
});

bottomLeftThird = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenSizeY * .66',
  width: 'screenSizeX / 2',
  height: 'screenSizeY / 3'
});

bottomLeft = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenSizeY / 2',
  width: 'screenSizeX / 2',
  height: 'screenSizeY / 2'
});

topRight = slate.operation('move', {
  x: 'screenSizeX / 2',
  y: 'screenOriginY',
  width: 'screenSizeX / 2',
  height: 'screenSizeY / 2'
});

bottomRight = slate.operation('move', {
  x: 'screenSizeX / 2',
  y: 'screenSizeY / 2',
  width: 'screenSizeX / 2',
  height: 'screenSizeY / 2'
});

slate.bind('1:ctrl', function (win) {
  win.doOperation(fullscreen);
});

slate.bind('2:ctrl', function (win) {
  win.doOperation(left);
});

slate.bind('3:ctrl', function (win) {
  win.doOperation(right);
});

slate.bind('4:ctrl', function (win) {
  win.doOperation(topLeft);
});

slate.bind('5:ctrl', function (win) {
  win.doOperation(bottomLeft);
});

slate.bind('6:ctrl', function (win) {
  win.doOperation(topRight);
});

slate.bind('7:ctrl', function (win) {
  win.doOperation(bottomRight);
});

slate.bind('8:ctrl', function (win) {
  win.doOperation(topLeftThird);
});

slate.bind('9:ctrl', function (win) {
  win.doOperation(midLeftThird);
});

slate.bind('0:ctrl', function (win) {
  win.doOperation(bottomLeftThird);
});
