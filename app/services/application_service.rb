class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end

  def result(status, data)
    OpenStruct.new({
      success: status,
      data: data
    })
  end
end