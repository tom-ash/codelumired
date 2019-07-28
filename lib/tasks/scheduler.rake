


task :obtaincurrencyrates => :environment do
  #TODO: UNLESS SUNDAY, MONDAY
  response = Net::HTTP.get('api.nbp.pl', '/api/exchangerates/tables/a')
  rates = JSON.parse(response)[0]["rates"]
  for rate in rates
    if rate['code'] == 'EUR'
      Currency.create(currency_type: 1, rate: rate['mid'] * 10000)
    elsif rate['code'] == 'USD'
      Currency.create(currency_type: 2, rate: rate['mid'] * 10000)
    end
  end
end

task :deleteunrefreshedannouncements => :environment do
  announcements_to_delete = Announcement.where("refreshed_at < :time", {:time => 30.day.ago})
  announcements_to_delete.destroy_all
end