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

    exhibition_recommanded = result.flatten.uniq
    exhibitions_ids_of_user_treated = UserExhibition.where(exhibition_id: exhibition_recommanded.pluck(:id), user_id: self.id, status: ["booked", "saved", "discarded"] ).pluck(:exhibition_id)
    exhibition_id_to_recommand = (exhibition_recommanded.pluck(:id) - exhibitions_ids_of_user_treated).first(3)
    exhibition_to_recommand = Exhibition.where(id: exhibition_id_to_recommand)
    exhibition_id_saved = UserExhibition.where(user_id: self.id, status: "saved").pluck(:exhibition_id)
    exhibition_saved = Exhibition.where(id: exhibition_id_saved)
    return all_exhibition_to_show = [exhibition_recommanded, exhibition_saved].flatten
  end
end


# current_user.user_exhibitions
