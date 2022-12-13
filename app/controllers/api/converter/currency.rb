module Api
  module Converter
    class Currency < Grape::API
      version "v1", using: :path
      format :json

      helpers do
        def get_exchange(currency)
          if currency === "USD"
            30
          else
            raise StandardError.new "No conversion found for currency '#{currency}'"
          end
        end
      end

      resource :converter do
        params do
          requires :amount, type: Float
          requires :to_currency, type: String
        end
        get :exchange do
          converted_amount =
            params[:amount] * get_exchange(params[:to_currency])
          { amount: converted_amount, currency: params[:to_currency] }
        end
      end
    end
  end
end
