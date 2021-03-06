package com.sunshine.dao;

import java.util.List;

import com.sunshine.model.Community;

public interface CommunityDao {
/**
 * 获取所有的社区
 */
  List<Community> getall();
		
	/**
	 * 根据社区id获取社区
	 * @param id 社区 id
	 * @return 对应的社区
	 */
	Community getCommunity(String id);
	
	/**
	 * 列出当前区域所有社区
	 * @param address 所选区域
	 * @return 社区列表
	 */
	List<Community> listLikeAddress(String address);
	
	/**
	 * 查询当前区域同名的社区<br>
	 * <font color='red'>该方法用于查重</font>
	 * @param name 社区名
	 * @param address 社区所在区域
	 * @return 记录数
	 */
	int countByNameAndAddress(String name, String address);
	
	/**
	 * 向数据库新增社区信息
	 * @param community 要注册的社区
	 * @return 数据库中受影响的记录数
	 */
	int saveCommunity(Community community);
	
	/**
	 * 更新社区信息
	 * @param community 社区信息
	 * @return 数据库中受影响的记录数
	 */
	int updateCommunity(Community community);
	
	/**
	 * 根据行政区号获取社区，查重用
	 * @param adminCode
	 * @return
	 */
	int countByAdminCode(String adminCode);
	/**
	 * 删除社区信息
	 * @param id 社区 id
	 * @return 数据库中受影响的记录数
	 */
	int removeCommunity(String id);
	
	/**
	 * 获取所有未处理的社区入驻请求
	 * @return
	 */
	List<Community> listAllUnHandled();
 
}
