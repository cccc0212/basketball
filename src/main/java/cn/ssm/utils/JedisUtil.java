package cn.ssm.utils;


import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class JedisUtil {
    private static String ADDR = "127.0.0.1";
    private static int PORT = 6379;
    private static String AUTH ;
    
    //最大连接数据库连接数
    private static int MAX_ACTIVE = 1024;
    
    //最大等待连接中的数量
    private static int MAX_IDLE = 200;
   // 最大等待毫秒数
    private static int MAX_WAIT = 10000;
    
    private static int TIMEOUT = 10000;
    
    private static boolean TEST_ON_BORROW = true;
    
    private static JedisPool jedisPool = null;
    
    static {
        try{
            JedisPoolConfig config = new JedisPoolConfig();
            config.setMaxIdle(MAX_IDLE);
            config.setMaxTotal(MAX_ACTIVE);
            config.setMaxWaitMillis(MAX_WAIT);
            config.setTestOnBorrow(TEST_ON_BORROW);
            jedisPool = new JedisPool(config,ADDR,PORT,TIMEOUT,AUTH);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public synchronized static Jedis getJedis(){
        try{
            if(jedisPool != null){
                Jedis jedis = jedisPool.getResource();
                return jedis;
            }else{
                return null;
            }
        }catch (Exception e) {
        	jedisPool.close();
            e.printStackTrace();
            return null;
        }
    }
    

/*	public static void returnResource(final Jedis jedis){
        if(jedis != null){
        	//jedisPool.returnResource(jedis);
        	jedisPool.close();
        }
    }*/
	
	// 出现异常释放资源  
	public synchronized void returnBrokenResource(Jedis jedis) {  
	    if (jedis != null) {  
	      //jedisPool.returnBrokenResource(jedis);  
	        jedisPool.close();
	    }  
	}  
}