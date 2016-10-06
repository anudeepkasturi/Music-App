# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Band < ActiveRecord::Base

  validates :name, presence: true

  has_many :albums,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Album,
    dependent: :destroy

  has_many :tracks,
    through: :albums,
    source: :tracks

  def add_album(album_name)
    unless self.id.nil?
      a = Album.create!(name: album_name, band_id: self.id)
    end
  end
end
