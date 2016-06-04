class House
  INTRO = "This is "

  class << self
    def recite
      rhyme = ""
      previous_stanza = ""
      phrases = pieces

      loop do
        current_pieces = phrases.pop
        stanza = create_stanza(stanza, current_pieces, previous_stanza)
        rhyme << INTRO + stanza
        previous_stanza = stanza
        break if phrases.empty?
      end
      rhyme.strip + "\n"
    end

    private

    def create_stanza(stanza, current_pieces, previous_stanza)
      stanza = ""
      until current_pieces.empty?
        stanza << current_pieces.shift
        stanza << "\n" if current_pieces.any?
      end
      previous_stanza.empty? ? stanza << ".\n\n" : stanza << " "
      stanza << previous_stanza
    end

    def pieces
      [
        ['the horse and the hound and the horn', 'that belonged to'],
        ['the farmer sowing his corn', 'that kept'],
        ['the rooster that crowed in the morn', 'that woke'],
        ['the priest all shaven and shorn', 'that married'],
        ['the man all tattered and torn', 'that kissed'],
        ['the maiden all forlorn', 'that milked'],
        ['the cow with the crumpled horn', 'that tossed'],
        ['the dog', 'that worried'],
        ['the cat', 'that killed'],
        ['the rat', 'that ate'],
        ['the malt', 'that lay in'],
        ['the house that Jack built']
      ]
    end
  end
end
