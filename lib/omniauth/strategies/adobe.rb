require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Adobe < OmniAuth::Strategies::OAuth2
      option :name, 'adobe'
      option :client_options, {
        site:          'https://ims-na1.adobelogin.com',
        authorize_url: 'ims/authorize',
        token_url:     'ims/token'
      }

      uid { raw_info['id'] }

      info do
        {
          name:  raw_info['name'],
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/ims/userinfo')
      end
    end
  end
end
