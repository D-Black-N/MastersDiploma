# frozen_string_literal: true

class CheckJob < ApplicationJob
  queue_as :default

  def perform(client_id)
    client = Client.find_by(id: client_id)
    client.documents.find_each do |document|
      document.update!(data: data, file_type: 'ndfl')
    end

    client.requests.find_each do |request|
      request.update(risk_level: :green, status: :agreed, verification_result: 'Успешно')
    end
  end

  private

  def data
    {
      info: {
        first_name: 'Данил',
        last_name: 'Насибуллин',
        middle_name: 'Ильнурович',
        organization: 'ООО "Тест"',
        organization_inn: '121401231241',
      },
      tables: [
        {
          name: 'Доходы, облагаемые по ставке 13%',
          body: {
            head: ['Месяц', 'Код дохода', 'Сумма дохода'],
            rows: [
              ['1', '2000', '19 777.06'],
              ['2', '2000', '88 557.27'],
              ['3', '2000', ''],
              ['4', '2000', ''],
              ['4', '2012', ''],
              ['5', '2000', ''],
              ['5', '2012', ''],
              ['6', '2000', ''],
              ['7', '2000', ''],
              ['7', '2012', ''],
              ['8', '2000', ''],
              ['8', '2012', ''],
              ['9', '2000', ''],
              ['9', '2013', ''],
            ]
          }
        }
      ],
      verification: {
        signatures: true,
        shtamps: true
      }
    }
  end
end
