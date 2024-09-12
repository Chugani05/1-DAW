from __future__ import annotations
from helpers import combinations
from cards import Card, Hand, Deck

class Dealer:
    def __init__(self, players: list[Player], common_cards: list[Card], private_cards: list[list[Card]]):
        self.deck = Deck()
        self.player1, self.player2 = players
        self.common_cards = common_cards
        self.private_cards = private_cards

    def deal_cards(self, num_cards: int) -> list:
        return [self.deck.pop(0) for _ in range(num_cards)]

    def revealcards(self) -> None:
        self.player1.recieve_cmoon_cards(self.common_cards)
        self.player2.recieve_cmoon_cards(self.common_cards)

    def deal_private_cards(self):
        self.player1.recieve_priv_cards(self.private_cards[0])
        self.player2.recieve_priv_cards(self.private_cards[1])

    
    def determine_best_hand(self) -> tuple[str | None, list[str]]:
        hand1 = self.player1.best_hand()
        hand2 = self.player2.best_hand()

        if hand1 > hand2:
            return (self.player1, hand1)
        elif hand1 < hand2:
            return (self.player2, hand2)
        elif hand1 == hand2:
            for h1, h2 in zip(hand1, hand2):
                if h1 > h2:
                    return (self.player1, hand1)
                elif h1 < h2:
                    return (self.player2, hand2)
        return None
    
    def determine_winner(self):
        self.revealcards()
        self.deal_private_cards()
        
        result = self.determine_best_hand()
        
        if result is None:
            return None, self.player1.best_hand()
        
        winner, best_hand = result
        return winner, best_hand


class Player:
    def __init__(self, name: str):
        self.name = name
        self.private_cards = []
        self.common_cards = []

    def __repr__(self) -> str:
        return self.name
    
    def recieve_priv_cards(self, cards: list[Card]):
        self.private_cards = cards
    
    def recieve_cmoon_cards(self, cards: list[Card]):
        self.common_cards = cards
        
    
    def best_hand(self):
        all_cards = self.common_cards + self.private_cards
        best_hand = None
        for hand in combinations(all_cards, n=5):
            hand = Hand(list(hand))
            if not best_hand or hand > best_hand:
                best_hand = hand
            elif best_hand == hand:
                for card1, card2 in zip(best_hand, hand):
                    if card1 < card2:
                        best_hand = hand
                        break 
                    elif card1 > card2:
                        break
        return best_hand

