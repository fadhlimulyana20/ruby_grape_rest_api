module Api
  module Job
    class Hello < Grape::API
      version "v1", using: :path

      resource :job do
        get :hello do
          HelloWorldJob.perform_later
          { hello: "world" }
        end
      end
    end
  end
end
