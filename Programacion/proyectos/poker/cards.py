from __future__ import annotations
from helpers import shuffle, combinations, random


class Card:
    VALUES = {'J': 11, 'Q': 12, 'K': 13, 'A': 14}
    def __init__(self, card:str):
        self.suit = card[-1]
        self.value_text = card[0:-1]
        self.value = self.VALUES[self.value_text] if self.value_text in self.VALUES else int(self.value_text)

    def __gt__(self, other: Card) -> bool:
        return self.value > other.value
    
    def __eq__(self, other) -> bool:
        return self.value == other
    
    def __repr__(self) -> str:
        return f"{self.value_text}{self.suit}"


class Deck:
    SUITS = ['♠', '♣', '◆', '❤']
    LETTERS = ['J', 'Q', 'K', 'A']
    def __init__(self):
        self.deck = []
        self.generate()

    def generate(self):
        for suit in self.SUITS:
            for num in range(2, 11):
                self.deck.append(Card(str(num) + suit))
            for n in range(4):
                self.deck.append(Card(self.LETTERS[n] + suit))
        
        random.shuffle(self.deck)

    def pop(self):
        if self.deck:
            return self.deck.pop()
        return None


class Hand:
    HIGH_CARD = 0
    ONE_PAIR = 1
    TWO_PAIR = 2
    THREE_OF_A_KIND = 3
    STRAIGHT = 4
    FLUSH = 5
    FULL_HOUSE = 6
    FOUR_OF_A_KIND = 7
    STRAIGHT_FLUSH = 8

    def __init__(self, cards: list[Card]):
        self.cards = cards
        self.cards = self.sort_by_value_and_frequency()
        self.cat, self.cat_rank = self.classify()
    
    def __repr__(self):
        return f'{self.cards}, {self.cat}, {self.cat_rank}'
    
    def __contains__(self, card):
        return card in self.cards
    
    def __gt__(self, other: Hand):
        return self.cat > other.cat
    
    def __getitem__(self, index: int):
        return self.cards[index]
    
    def __iter__(self):
        for card in self.cards:
            yield card
    
    def __eq__(self, other:Hand):
        return self.cat == other.cat 

    def classify(self):
        
        if self.is_straight_flush():
            return Hand.STRAIGHT_FLUSH, self.get_high_card()
        elif self.is_four_of_a_kind():
            return Hand.FOUR_OF_A_KIND, self.get_high_card()
        elif self.is_full_house():
            return Hand.FULL_HOUSE, (self.get_high_card(), self[3].value_text)
        elif self.is_flush():
            return Hand.FLUSH, self.get_high_card()
        elif self.is_straight():
            return Hand.STRAIGHT, self.get_high_card()
        elif self.is_three_of_a_kind():
            return Hand.THREE_OF_A_KIND, self.get_high_card()
        elif self.is_two_pair():
            return Hand.TWO_PAIR, (self.get_high_card(), self[2].value_text)
        elif self.is_one_pair():
            return Hand.ONE_PAIR, self.get_high_card()
        
        return Hand.HIGH_CARD, self.get_high_card()

    def get_high_card(self) -> bool:
        return self[0].value_text
    
    def is_four_of_a_kind(self):
        return self[0] == self[1] == self[2] == self[3]

    def is_flush(self):
        first_suit = self[0].suit
        return all(card.suit == first_suit for card in self)
    
    def is_one_pair(self) -> bool:
        return self[0] == self[1]
    
    def sort_by_value_and_frequency(cards):
        value_counts = {}
        for card in cards:
            if card.value in value_counts:
                value_counts[card.value] += 1
            else:
                value_counts[card.value] = 1
        return sorted(cards, key=lambda card: (value_counts[card.value], card.value), reverse=True)

    def is_two_pair(self) -> bool:
        return self[0] == self[1] and self[2] == self[3]
                
    def is_three_of_a_kind(self) -> bool:
        return self[0] == self[1] == self[2]

    def is_straight(self) -> bool:
        values = [card.value for card in self]
        target_card = values[0]
        for value in values[1:]:
            if target_card - 1 != value:
                return False
            target_card = value
        return True
        

    def is_full_house(self) -> bool:
        return self[0] == self[1] == self[2] and self[3] == self[4]
            
    def is_straight_flush(self) -> bool:
        return self.is_straight() and self.is_flush()



    