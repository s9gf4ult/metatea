module TeaComparsionsHelper
  def select_second_tea_path(first_tea, *args)
    r = "/tea_comparsions/compare/#{first_tea.id}"
    if args
      r << "?#{args.to_query}"
    else
      r
    end
  end

  def compare_teas_path(first_tea, second_tea, *args)
    r = "/tea_comparsions/compare/#{first_tea.id}/#{second_tea.id}"
    if args
      r << "?#{args.to_query}"
    else
      r
    end
  end

end
