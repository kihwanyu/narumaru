package com.kh.narumaru.member.model.service;

import java.util.ArrayList;

import com.kh.narumaru.member.model.exception.selectChanelException;
import com.kh.narumaru.member.model.vo.Channel;

public interface ChannelService {

	ArrayList<Channel> selectAllChannel() throws selectChanelException;

}
