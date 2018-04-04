class BaseballPlayer
  def initialize(player_hash)
    player_hash.each do |stat, value|
      self.class.send(:define_method, "#{stat}=".to_sym) do |value|
        instance_variable_set("@" + stat.to_s, value)
      end

      self.class.send(:define_method, stat.to_sym) do
        instance_variable_get("@" + stat.to_s)
      end

      self.send("#{stat}=".to_sym, value)
    end
  end
end

