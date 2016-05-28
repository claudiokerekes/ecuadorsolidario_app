class Caso < ActiveRecord::Base
  belongs_to :user
  has_many :imagens
  has_many :recursos

  accepts_nested_attributes_for :recursos, :imagens

  geocoded_by :ubicacion
  validates_presence_of :titulo, :problema, :ubicacion
  YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([\A#\&\?]*).*/i
  if :youtubevideo
    validates :youtubevideo, :allow_blank => true, format: YT_LINK_FORMAT
  end
  def to_param
  "#{id} #{titulo}".parameterize
  end
  after_validation :geocode
end
