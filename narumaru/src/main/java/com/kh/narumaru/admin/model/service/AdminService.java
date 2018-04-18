package com.kh.narumaru.admin.model.service;

import java.util.ArrayList;

import com.kh.narumaru.admin.model.vo.Admin;
import com.kh.narumaru.notice.model.vo.Notice;

public interface AdminService {

	ArrayList<Admin> showTotalView(ArrayList<Admin> a);

	void insertNotice(Notice n);


}
