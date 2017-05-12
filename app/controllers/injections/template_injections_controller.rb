class Injections::TemplateInjectionsController < ApplicationController

  def index
    render json: {
      template_injection_command: injection_command.hint
    }
  end

  def interpolation
    render html: injection_command.execute
  end

  private

  def injection_command
    @injection_command ||= TemplateInjection.new(
      template_injection_params.fetch(:name, '🐩')
    )
  end

  def template_injection_params
    params.permit(:name)
  end
end
