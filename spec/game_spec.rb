require_relative '../app'

describe Game do
  let(:game) { described_class.new(:player1, :player2) }
  describe '#player' do
    it 'shoud create two players when we initialize' do
      expect(game.player1).to be_an_instance_of Player
      expect(game.player2).to be_an_instance_of Player
    end
  end
  describe '#turn_switcher' do
    it 'changes the player attacking' do
      expect(game.turn_switcher).to eq game.player2
      expect(game.turn_switcher).to eq game.player1
    end
  end
  describe '#attack' do
    it 'reduces the other players hp points' do
      expect { game.attack }.to change { game.player2.hp }.by(-10)
    end
  end
end
