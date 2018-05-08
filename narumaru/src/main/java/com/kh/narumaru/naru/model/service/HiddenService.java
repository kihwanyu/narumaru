package com.kh.narumaru.naru.model.service;

import java.util.ArrayList;

import com.kh.narumaru.naru.model.vo.HiddenPayment;

public interface HiddenService {

	ArrayList<HiddenPayment> selectHiddenPaymentList(int mno);

}
