module TeaComparsionsHelper

  def select_second_tea_path(first_tea, *rest)
    r = "/tea_comparsions/compare/#{first_tea.id}"
    if rest.length > 0
      r << "?#{rest.to_query}"
    else
      r
    end
  end

  def compare_teas_path(first_tea, second_tea, *rest)
    r = "/tea_comparsions/compare/#{first_tea.id}/#{second_tea.id}"
    if rest.length > 0
      r << "?#{rest.to_query}"
    else
      r
    end
  end

end
