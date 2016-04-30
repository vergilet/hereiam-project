url = YAML.load_file('config/redis/cable.yml')['production']['url']
redis = Redis.new(url: url)