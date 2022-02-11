class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :ensure_domain, if: :production?
  FQDN = 'jojo-pose-exam.jp'.freeze

  def ensure_domain
    return unless /\.herokuapp.com/.match?(request.host)

    port = ":#{request.port}" unless [80, 443].include?(request.port)
    redirect_to "#{request.protocol}#{FQDN}#{port}#{request.path}", status: :moved_permanently
  end

  def production?
    Rails.env.production?
  end
end
