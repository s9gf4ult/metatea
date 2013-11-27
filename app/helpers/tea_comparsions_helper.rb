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

  def create_comparsion_path(axis_name, first_tea, right_tea, left_tea, result = SETTINGS[:axis][:grade][0])
    tea_comparsions_path("tea_comparsion[axis_name]" => axis_name,
                         "tea_comparsion[left_tea_id]" => left_tea.id,
                         "tea_comparsion[right_tea_id]" => right_tea.id,
                         "tea_comparsion[result]" => result,
                         "first_tea_id" => first_tea.id)
  end

end
