class ApplicationService
  attr_reader :result

  def perform
    raise NotImplementedError
  end

  def self.process(*params)
    new(*params).perform.result
  end
end
