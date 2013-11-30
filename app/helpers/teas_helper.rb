module TeasHelper
  def self.hash_values_list(hash)
    hash.collect do |k, v|
      if v.is_a? Hash
        hash_values_list v
      else
        [v]
      end
    end.reduce :+
  end
end
