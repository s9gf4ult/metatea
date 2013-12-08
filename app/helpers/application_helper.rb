module ApplicationHelper

  # convert hash to optarg tree
  def opt_hash(h, selected)
    h.collect do |k, v|
      if v.is_a? Hash
        content_tag :optgroup, :label => t(k) do
          opt_hash(v, selected)
        end
      else
        s = v == selected if selected
        content_tag :option, :value => v, :selected => s do
          t v
        end
      end
    end.reduce(:concat)
  end

  def hash_links_tree(h, lmargin)
    h.collect do |k, v|
      if v.is_a? Hash
        r = content_tag :div do
          t(k)
        end
        r << content_tag(:div, :style => "padding-left: #{lmargin}") do
          hash_links_tree v, lmargin
        end
        r
      else
        content_tag :div do
          link_to teas_path("tea[category]" => v) do
            t v
          end
        end
      end
    end.reduce(:concat)
  end

end
