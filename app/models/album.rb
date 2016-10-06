# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  yr         :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class Album < ActiveRecord::Base

  validates :band_id, :name, presence: true

  has_many :tracks,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Track,
    dependent: :destroy

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band

  def add_tracks(track_names)
    unless self.id.nil?
      if track_names.is_a? String
        Track.create!(name: track_names, album_id: self.id)
      else
        track_names.each do |track_name|
          Track.create!(name: track_name, album_id: self.id)
        end
      end
    end
  end
end
