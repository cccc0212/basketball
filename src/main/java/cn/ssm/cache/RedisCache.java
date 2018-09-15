package cn.ssm.cache;

import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import org.apache.ibatis.cache.Cache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.ssm.utils.*;
/*
 * 使用第三方缓存服务器，处理二级缓存
 */

public class RedisCache implements Cache {
    private static Logger logger = LoggerFactory.getLogger(RedisCache.class); 

    /** The ReadWriteLock. */ 

    private final ReadWriteLock readWriteLock = new ReentrantReadWriteLock();

     

    private String id;

     

    public RedisCache(final String id) {  

        if (id == null) {

            throw new IllegalArgumentException("Cache instances require an ID");

        }

        logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>MybatisRedisCache:id="+id);

        this.id = id;

    }  

     

    public String getId() {

        return this.id;

    }

 

    public void putObject(Object key, Object value) {

        logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>putObject:"+key+"="+value);

        JedisUtil.getJedis().set(SerializeUtil.serialize(key.toString()), SerializeUtil.serialize(value));
        //JedisUtil.getJedis().set(SerializeUtil.serialize(key.toString()),SerializeUtil.serialize(value));

    }

 

    public Object getObject(Object key) {

        Object value = SerializeUtil.unSerialize(JedisUtil.getJedis().get(SerializeUtil.serialize(key.toString())));
        //Object value = SerializeUtil.unserialize(JedisUtil.getJedis().get(SerializeUtil.serialize(key.toString())));
        logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>getObject:"+key+"="+value);

        return value;

    }

 

    public Object removeObject(Object key) {

        return JedisUtil.getJedis().expire(SerializeUtil.serialize(key.toString()),0);

    }

 

    public void clear() {

        JedisUtil.getJedis().flushDB();

    }

 

    public int getSize() {

        return Integer.valueOf(JedisUtil.getJedis().dbSize().toString());

    }

 

    public ReadWriteLock getReadWriteLock() {

        return readWriteLock;

    }
}