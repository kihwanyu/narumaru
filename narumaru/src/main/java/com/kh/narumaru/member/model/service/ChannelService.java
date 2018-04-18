package com.kh.narumaru.member.model.service;

import java.util.ArrayList;

import com.kh.narumaru.member.model.exception.memberChannelChangeException;
import com.kh.narumaru.member.model.exception.selectChanelException;
import com.kh.narumaru.member.model.vo.Channel;
import com.kh.narumaru.member.model.vo.MChannel;

public interface ChannelService {

	ArrayList<Channel> selectAllChannel() throws selectChanelException;

	void memberChannelChange(ArrayList<MChannel> mchList) throws memberChannelChangeException;

	ArrayList<Channel> selectMemberChannel(int mno) throws selectChanelException;

}
