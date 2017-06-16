class XssController < ApplicationController

  def index
    render json: {
      xss_parameter: xss_parameter.hint
    }
  end

  def parameter
    render html: xss_parameter.html
  end

  private

  def xss_parameter
    @xss_parameter ||= XSSParameter.new(
      xss_parameter_params.fetch(:name, 'World!')
    )
  end

  def xss_params
    params.permit(:name)
  end
end
