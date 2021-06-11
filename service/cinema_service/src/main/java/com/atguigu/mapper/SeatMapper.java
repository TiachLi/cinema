package com.atguigu.mapper;

import com.atguigu.entity.Seat;
import com.atguigu.entity.vo.SelectedSeatVo;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.StatementType;

import java.util.List;

public interface SeatMapper {
    //添加座位信息
    @Insert("insert into seat values(#{seatId},#{hallName},#{seatLine},#{seatCow},#{isUsable})")
    void insertSeat(Seat seat);
    //设置座位为不可用
    @Update("update seat set is_usable=0 where seat_id=#{seatId}")
    void setSeatDisable(String seatId);
    //根据影厅名删除座位信息
    @Delete("delete from seat where hall_name=#{hallName}")
    void deleteByHallName(String hallName);
    //根据影厅名查询
    @Select("select * from seat where hall_name=#{hallName}")
    List<Seat> selectByHallName(String hallName);
    //查询确定场次座位状态
    @Select("call selectSeat (#{playListId},#{hallName})")
    @Options(statementType=StatementType.CALLABLE)
    List<SelectedSeatVo> selectSelectedSeat(@Param("playListId") String playListId,@Param("hallName") String hallName);
    //设置座位全部可用
    @Update("update seat set is_usable=1 where hall_name=#{hallName}")
    void setAllUsable(String hallName);
    //查询影厅可用座位数
    @Select("select count(1) from seat where hall_name=#{hallName} and is_usable=1")
    int getUsable(String hallName);
}
