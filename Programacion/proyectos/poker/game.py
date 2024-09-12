from __future__ import annotations
from roles import Dealer, Player
from cards import Card, Deck, Hand

class Game:
    @staticmethod
    def get_winner(players: list[Player], common_cards: list[Card], private_cards: list[list[Card]]) -> tuple[Player | None, Hand]:
        dealer = Dealer(players, common_cards, private_cards)
        return dealer.determine_winner()

