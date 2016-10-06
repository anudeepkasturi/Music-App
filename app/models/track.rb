# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string

class Track < ActiveRecord::Base

  validates :album_id, :name, presence: true

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album

  has_one :band,
    through: :album,
    source: :band
end
