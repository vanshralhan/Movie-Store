module MovieHelper
  def imglast(index)
      if index == 0
        return "active"
      else
      end
  end

  def view_check(sorted)
    if sorted == "view"
      return "active"
    end
  end

  def rating_check(sorted)
    if sorted == "rating"
      return "active"
    end
  end

  def id_check(sorting)
    if sorting == "rating"
      return "#panel-85832"
    elsif sorting == "view"
      return "panel-998541"
    end
  end

end
