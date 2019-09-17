const View = require('./ttt-view.js')
const Game = require('../tic_tac_toe_node/game.js')

  $(() => {
    
    new View(new Game(),$('.ttt'));
    
  });
