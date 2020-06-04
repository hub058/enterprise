package com.enterprise.core;

import com.enterprise.cache.CacheProvider;
import com.enterprise.cache.SimpleCacheProvider;
import com.enterprise.entity.*;
import org.apache.commons.lang.StringUtils;

import javax.annotation.PostConstruct;
import java.io.Serializable;
import java.util.List;
import java.util.Properties;


/**
 * 系统管理类
 *
 */
public class SystemManage {
    private static Properties p = new Properties();
    private static CacheProvider cacheProvider = new SimpleCacheProvider();
    private static SystemManage instance;

    @PostConstruct
    public void afterPropertiesSet() {
        instance = this;
    }


    public static SystemManage getInstance() {
        return instance;
    }

    public CacheProvider getCacheProvider() {
        return cacheProvider;
    }

    public void setCacheProvider(CacheProvider cacheProvider) {
        SystemManage.cacheProvider = cacheProvider;
    }

    public String getProperty(String key) {
        return p.getProperty(key);
    }

    private static String buildKey(String key) {
        return "SystemManage." + StringUtils.trimToEmpty(key);
    }

    private static void putCacheObject(String key, Serializable cacheObject) {
        String key1 = buildKey(key);
        if (cacheObject == null) {
            cacheProvider.remove(key1);
        } else {
            cacheProvider.put(key1, cacheObject);
        }
    }

    private static <T extends Serializable> T getCacheObject(String key) {
        return (T) cacheProvider.get(buildKey(key));
    }

    //系统设置
    public SystemSetting getSystemSetting() {
        return getCacheObject("systemSetting");
    }

    public void setSystemSetting(SystemSetting systemSetting) {
        putCacheObject("systemSetting", systemSetting);
    }

    //友情链接
    public List<FriendLinks> getFriendLinks() {
        return getCacheObject("friendLinks");
    }

    public void setFriendLinks(List<FriendLinks> friendLinks) {
        putCacheObject("friendLinks", (Serializable) (friendLinks));
    }

    //招聘信息
    public List<Recruitment> getRecruitments() {
        return getCacheObject("recruitments");
    }

    public void setRecruitments(List<Recruitment> recruitments) {
        putCacheObject("recruitments", (Serializable) (recruitments));
    }

    //门户图片
    public List<IndexImg> getIndexImgs() {return getCacheObject("indexImgs");}

    public void setIndexImgs(List<IndexImg> indexImgs){
        putCacheObject("indexImgs",(Serializable)(indexImgs));
    }

    //前五条留言
    public List<Messages> getMessages(){return getCacheObject("messages");}

    public void setMessages(List<Messages> messages){putCacheObject("messages",(Serializable)(messages));}

    //文章类别
    public List<ArticleCategory> getArticleCategory(){
        return getCacheObject("articleCategory");
    }
    public void setArticleCategory(List<ArticleCategory> articleCategory){
        putCacheObject("articleCategory",(Serializable)(articleCategory));
    }
    //联系我们
    public Contact getContact(){
        return getCacheObject("contacts");
    }
    public void setContact(Contact contacts){
        putCacheObject("contacts",(Serializable)(contacts));
    }

    //关于我们
    public About getAbout(){
        return getCacheObject("about");
    }
    public void setAbout(About abouts){
        putCacheObject("about",(Serializable)(abouts));
    }

    //服务领域
    public List<Service> getService(){
        return getCacheObject("services");
    }
    public void setService(List<Service> servies){
        putCacheObject("services",(Serializable)(servies));
    }

    //服务卡片
    public List<ServiceCard> getServiceCard(){
        return getCacheObject("serviceCard");
    }
    public void setServiceCard(List<ServiceCard> data){
        putCacheObject("serviceCard",(Serializable)(data));
    }


}
