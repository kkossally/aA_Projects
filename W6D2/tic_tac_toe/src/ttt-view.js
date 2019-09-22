class View {
  constructor(game, $el) {
    $el.append(this.setupBoard());
    this.game = game;
    this.bindEvents();
  }

  bindEvents() {
    $('ul').on('click', 'li', event => {
      this.makeMove($(event.target));
    })
    window.onerror = function() {
      alert('Invalid move! Try again.');
    }
  }
  
  makeMove($square) {
    this.game.playMove($square.data("pos"));
    if (this.MoveError) { alert('Hey!') }
    $square.addClass(this.game.currentPlayer);
    $square.removeClass('nonyellow');
    
    if (this.game.isOver()) {
      // console.log('Over');
      $('ul').off('click');
      const winner = this.game.winner();
      if (winner) {
        $(`.${winner}`).addClass('celebrate');
      } else {
        alert('DRAW!')
      }
    }
  }

  setupBoard() {
    const $grid = $("<ul id='grid'></ul>");

    const positions =  
      [[0, 0], [0, 1], [0, 2],
      [1, 0], [1, 1], [1, 2],
      [2, 0], [2, 1], [2, 2]];

    for (let i = 0; i < 9; i++) {
      let pos = positions[i];
      const $li = $("<li class='nonyellow'></li>");
    
      $li.data("pos", pos);
      $grid.append($li);
    }

    return $grid;
  }
}

module.exports = View;
