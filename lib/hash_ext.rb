# from ActiveSupport
class Hash

  end

  def symbolize_keys!
    self.replace(self.symbolize_keys)
  end
end
