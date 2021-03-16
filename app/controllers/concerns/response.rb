# frozen_string_literal: true

module Response
  def json_response(object, status = :ok)
    if object.respond_to?(:serlializable_hash)
      object =  object.serializable_hash.as_json
    end

    render json: object, status: status
  end
end
