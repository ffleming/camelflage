class TimingVulnerabilitiesController < ApplicationController
  def login
    user_result = user_finder.execute
    comparator_result = string_comparator.execute
    determine_access(user_result && comparator_result)
  end

  def conditional_hashing
    determine_access(user_finder.execute)
  end

  def string_comparison
    determine_access(string_comparator.execute)
  end

  def basic_auth
    result = authenticate_with_http_basic do |user, password|
        InsecureStringComparison.new(password, delta: timing_params[:delta]).execute
      end
    determine_access(result)
  end

  def index
    render json: {
      conditional_hashing: user_finder.hint,
      insecure_string_comparison: string_comparator.hint,
    }
  end

  private

  def user_finder
    @user_finder ||= ConditionalHashing.new(timing_params[:email],
                                            delta: timing_params[:delta])
  end

  def string_comparator
    @string_comparator ||= InsecureStringComparison.new(timing_params[:password],
                                                        delta: timing_params[:delta])
  end

  def timing_params
    params.permit(:email, :password, :delta)
  end

  def determine_access(bool)
    if bool
      render plain: "Authorized", status: :ok
    else
      render plain: "Unauthorized", status: :unauthorized
    end
  end
end
