class RedisHandle
  def write(key, val, ex: 10*60)
    $redis.set key, val, ex: ex
  end

  def read(key)
    $redis.get key
  end

  def del(key)
    $redis.del key
  end
end
