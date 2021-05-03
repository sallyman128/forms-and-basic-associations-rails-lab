class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(name)
    self.genre = Genre.find_by(name: name)
  end

  def genre_id
    self.genre ? self.genre.name : nil
  end

  def note_contents=(note_arr)
    note_arr.each do |note_content|
      self.notes << Note.create(content: note_content)
    end
  end

  def note_contents
    self.notes ? self.notes.content : nil
  end
end
