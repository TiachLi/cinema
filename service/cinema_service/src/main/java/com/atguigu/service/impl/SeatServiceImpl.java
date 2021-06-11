package com.atguigu.service.impl;

import com.atguigu.entity.Seat;
import com.atguigu.entity.vo.SeatListVo;
import com.atguigu.entity.vo.SeatVo;
import com.atguigu.entity.vo.SelectedSeatVo;
import com.atguigu.mapper.HallMapper;
import com.atguigu.mapper.SeatMapper;
import com.atguigu.service.SeatService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.*;

@Service("seatService")
public class SeatServiceImpl implements SeatService {
    @Resource
    SeatMapper seatMapper;
    @Resource
    HallMapper hallMapper;

    //添加座位信息,同时更新影厅信息中的座位数
    @Override
    public void addSeats(SeatVo seatVo) {
        //更改座位数
        changeSeats(seatVo);
    }
    //设置座位为不可用
    @Override
    @Transactional
    public void setSeatDisable(List<String> ids,String hallName) {
        //全部更新为可用
        seatMapper.setAllUsable(hallName);
        //将list转为seat去重
        Set<String> stringSet = new HashSet<>(ids);
        for (String id : stringSet) {
            seatMapper.setSeatDisable(id);
        }
        //查询影厅可用座位数
        int count = seatMapper.getUsable(hallName);
        //设置可用数
        hallMapper.setIsUsable(hallName,count);
    }

    //先删除原有的座位信息，再重新添加
    @Override
    public void updateSeats(SeatVo seatVo) {
        //改变座位数量
        seatMapper.deleteByHallName(seatVo.getHallName());
        changeSeats(seatVo);
    }
    //获取全部座位信息
    @Override
    public Map<Integer, List<Seat>> getAllSeats(String hallName) {

        List<Seat> seatList = seatMapper.selectByHallName(hallName);
        Map<Integer, List<Seat>> finalMap = new TreeMap<>();
        for (Seat seat : seatList) {
            List<Seat> cowList = finalMap.get(seat.getSeatLine());
            if (cowList==null){
                cowList=new ArrayList<>();
                cowList.add(seat);
                finalMap.put(seat.getSeatLine(),cowList);
            }else {
                cowList.add(seat);
            }
        }
        //对列进行排序
        for (Map.Entry<Integer,List<Seat>> entry :finalMap.entrySet()) {
            List<Seat> value = entry.getValue();
            value.sort(new SeatCowComparator());
        }
        return finalMap;
    }
    // 获取某一影厅全部的座位信息
    @Override
    public Map<Integer, List<SelectedSeatVo>> getAllSeatsWithHallName(String playListId, String hallName) {
        Map<Integer, List<SelectedSeatVo>> finalMap = new TreeMap<>();
        List<SelectedSeatVo> seatList=seatMapper.selectSelectedSeat(playListId,hallName);
        for (SelectedSeatVo seat : seatList) {
            List<SelectedSeatVo> cowList = finalMap.get(seat.getSeatLine());
            if (cowList==null){
                cowList=new ArrayList<>();
                cowList.add(seat);
                finalMap.put(seat.getSeatLine(),cowList);
            }else {
                cowList.add(seat);
            }
        }
        //对列进行排序
        for (Map.Entry<Integer,List<SelectedSeatVo>> entry :finalMap.entrySet()) {
            List<SelectedSeatVo> value = entry.getValue();
            value.sort(new SelectedCowComparator());
        }
        return finalMap;
    }
    private class SelectedCowComparator implements Comparator<SelectedSeatVo> {
        @Override
        public int compare(SelectedSeatVo o1, SelectedSeatVo o2) {
            return o1.getSeatCow()-o2.getSeatCow() ;
        }
    }
    private class SeatCowComparator implements Comparator<Seat> {
        @Override
        public int compare(Seat o1, Seat o2) {
            return o1.getSeatCow()-o2.getSeatCow() ;
        }
    }

    private void changeSeats(SeatVo seatVo) {
        String totalLinesStr = seatVo.getTotalLines();
        String totalCowsStr = seatVo.getTotalCows();
        int totalLines;
        int totalCows;
        totalLines = Integer.parseInt(totalLinesStr);
        totalCows = Integer.parseInt(totalCowsStr);
        //遍历全部座位
        for (int currentLine = 1; currentLine <=totalLines ; currentLine++) {
            for (int currentCow = 1; currentCow <=totalCows ; currentCow++) {
                Seat seat = new Seat();
                seat.setHallName(seatVo.getHallName());//设置影厅名
                seat.setSeatLine(currentLine);//设置行
                seat.setSeatCow(currentCow);//设置列
                seat.setIsUsable(1);//默认可用
                seatMapper.insertSeat(seat);//添加进数据库
            }
        }
    }

}
