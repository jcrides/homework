#!/usr/bin/env ruby

class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def output_card
    puts "The #{@rank} of #{@suit}"
  end

  def to_s
    "The #{@rank} of #{@suit}"
  end

  def self.random_card
    Card.new(rand(10), :spades)
  end

end

class Deck

  def initialize
    values = [:A,2,3,4,5,6,7,8,9,10,:J,:Q,:K]
    suits = [:Clubs, :Diamonds, :Hearts, :Spades]
    @cards = []

    suits.each do |suit|
      values.each do |value|
        @cards << Card.new(value, suit)
      end
    end

  end

  def output
    @cards.each { |card| puts card }
  end

  def shuffle!
    @cards.shuffle!
  end

  def deal
    dealt = @cards.shift
    puts "Now dealing: #{dealt.rank} of #{dealt.suit}"
  end

end

deck = Deck.new
