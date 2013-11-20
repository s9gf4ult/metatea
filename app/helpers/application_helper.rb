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
          t k
        end
      end
    end.reduce(:concat)

  end


end
