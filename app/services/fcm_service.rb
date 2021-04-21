require 'fcm'

class FcmService
  FCM_TOKEN = Rails.application.credentials.fcm[:fcm_key]

  def self.send(condition_name, floor_name, status)
    fcm = FCM.new(FCM_TOKEN)

    registration_ids = User.where.not(device_token: nil).pluck(:device_token)

    options = {
      "notification": {
        "title": 'Aviso de Variable fuera de rango',
        "body": "La lectura recibida en #{floor_name} para la variable #{condition_name} fue registrada como #{status}. Favor revisar"
      }
    }

    fcm.send(registration_ids, options)
  end
end
