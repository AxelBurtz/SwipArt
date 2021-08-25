class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_exhibitions
  has_many :reviews
  acts_as_favoritor

  def recomandations_author
    author = Artwork.joins(:author).where(id: all_favorites.pluck(:favoritable_id)).group('authors.id').count.sort_by {|k,v| -v}.first(5)
    exhibition_ids = ExhibitionAuthor.where(author_id: author.map{|a| a[0]}).pluck(:exhibition_id)
    Exhibition.where(id: exhibition_ids)
  end

  def recomandations_type
    type = Artwork.joins(:type).where(id: all_favorites.pluck(:favoritable_id)).group('types.id').count.sort_by {|k,v| -v}.first(5)
    exhibition_ids = ExhibitionType.where(type_id: type.map{|a| a[0]}).pluck(:exhibition_id)
    Exhibition.where(id: exhibition_ids)
  end

  def recomandations_museum
    museum = Artwork.where(id: all_favorites.pluck(:favoritable_id)).group("museum").count.sort_by {|k,v| -v}.first(5)
    Exhibition.where(museum: museum.map { |a| a[0] })
  end

  def recomandations_mouvement
    mouvement = Artwork.where(id: all_favorites.pluck(:favoritable_id)).group("mouvement").count.sort_by {|k,v| -v}.first(5)
    Exhibition.where(mouvement: mouvement.map { |a| a[0] })
  end

  def recomandations
    a = recomandations_author
    b = recomandations_type
    c = recomandations_museum
    d = recomandations_mouvement

    ab = a & b
    ac = a & c
    ad = a & d
    bc = b & c
    bd = b & d
    cd = c & d

    abc = a & b & c
    abd = a & b & d
    bcd = b & c & d
    cda = c & d & a

    abcd = a & b & c & d

    if abcd != []
      abcd
    elsif abc != []
      abc
    elsif abd != []
      abd
    elsif bcd != []
      bcd
    elsif cda != []
      cda
    elsif ab != []
      ab
    elsif ac != []
      ac
    elsif ad != []
      ad
    elsif bc != []
      bc
    elsif bd != []
      bd
    elsif cd != []
      cd
    elsif a != []
      a
    elsif b != []
      b
    elsif c != []
      c
    elsif d !=[]
      d
    else
      []
    end
  end

  result = []
    if abcd != []
      result << abcd
    elsif abc != []
      result << abc
    elsif abd != []
      result << abd
    elsif bcd != []
      result << bcd
    elsif cda != []
      result << cda
    elsif ab != []
      result << ab
    elsif ac != []
      result << ac
    elsif ad != []
      result << ad
    elsif bc != []
      result << bc
    elsif bd != []
      result << bd
    elsif cd != []
      result << cd
    elsif a != []
      result << a
    elsif b != []
      result << b
    elsif c != []
      result << c
    elsif d !=[]
      result << d
    else
      []
    end
  end

end
