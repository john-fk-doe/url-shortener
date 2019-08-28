namespace :db do
  desc "Generating urls, ips and location. Filling DB so we can work with some more real data"

  task :generate_fake_data do
    1000.times do
      Link.create!(original: Faker::Internet.url, short: SecureRandom.base58(8))
    end
    1000.times do
      Visit.create!(ip: Faker::Internet.public_ip_v4_address,
                    location: Faker::Address.country, link: Link.all.sample,
                    created_at: Time.now + rand(1..300).minutes)
    end

    puts "Links total: #{Link.count}, visits total: #{Visit.count}"
  end
end
