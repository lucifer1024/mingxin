package mingxin;

import com.liuzx.mingxin.domain.User;
import com.liuzx.mingxin.utils.UUIDGenerator;

public class InitUser {
	private static int num = 1;

	public static void main(String[] args) {
		initAdminUser();
		initVIP();
		initVIPNoPw();
		initHuiyuanNoPw();

	}

	private static void initHuiyuanNoPw() {
		String userNickNameArray[] = { "海宝", "黄浦水", "小云龙123", "伴你行你能行", "孙春华", "思如影", "一年买十天", "老人与海", "小蔡626", "阳光大叔",
				"蓝色火焰", "马超孟起", "巴人炒白银", "魔鬼的手", "牡丹花下活", "股与心", "木木兮3", "呼呼哈嘿", "花开花落", "顺风升", "梵思", "红燕燕", "小妖未成精",
				"kiss杰", "涨一发发发", "joyzhanglxl", "Erevjl", "yorkkitty", "黑木崖hero", "沪16281490367285", ".天神.", "灰色代码",
				"祖辉蔡", "活一天炒一天", "allenll8", "guhjross", "xinpingsun" };
		int userOrder = 20;
		int roleId = 5;
		for (int i = 0; i < userNickNameArray.length; i++) {
			User user = new User();
			user.setUid(UUIDGenerator.getUUID());
			user.setUserName(userNickNameArray[i]);
			user.setNickName(userNickNameArray[i]);
			user.setQq("315898519");
			user.setUserOrder(userOrder);
			user.setRoleId(roleId);
			System.out.println(insertSql(num++, user.getUid(), user.getUserName(), "", user.getNickName(), user.getQq(),
					user.getUserOrder(), user.getRoleId()));
		}
	}

	private static void initVIPNoPw() {
		String userNickNameArray[] = { "吉祥如意", "活在当下", "仙草根", "良人", "炒鸡棒棒鸡", "萌萌哒萌萌哒", "正山小种", "天池之岸", "伟倬", "得道多助",
				"万福香", "囔囔", "宁靖致远", "岁月流金", "wtjm", "0一切随缘0", "吴工2017", "不贪果断", "华为188", "挖掘机小哥", "阿森08", "钱柜钥匙",
				"A倒计时", "侯人兮逸", "visual曦", "俭民", "梦想12345", "白玉兰湘江", "盗梦空间111", "再满仓就剁手", "浩仔t", "zhang鑫", "xiaobei",
				"335砖头", "西方来客", "秋至风", "淡淡飘云流水人家", "天山之水", "柯岩燕", "不懂不怕输", "巴山夜雨潇湘客", "杨贵红", "大丰收888", "罗汉竹", "刂了",
				"王凯风", "佑你左我", "河东流水", "挥手淡然" };
		int userOrder = 15;
		int roleId = 4;
		for (int i = 0; i < userNickNameArray.length; i++) {
			User user = new User();
			user.setUid(UUIDGenerator.getUUID());
			user.setUserName(userNickNameArray[i]);
			user.setNickName(userNickNameArray[i]);
			user.setQq("315898519");
			user.setUserOrder(userOrder);
			user.setRoleId(roleId);
			System.out.println(insertSql(num++, user.getUid(), user.getUserName(), "", user.getNickName(), user.getQq(),
					user.getUserOrder(), user.getRoleId()));
		}
	}

	private static void initVIP() {
		String userQQArray[] = { "315898519", "315898519", "315898519", "315898519", "315898519" };
		String userNickNameArray[] = { "钱多多", "只如初见", "优股", "二锅头", "小浅" };
		// String userNameArray[] = { "qianduoduo", "zhiruchujian", "yougu",
		// "erguotou", "xiaoqian" };
		int userOrder = 15;
		int roleId = 4;
		for (int i = 0; i < userQQArray.length; i++) {
			User user = new User();
			user.setUid(UUIDGenerator.getUUID());
			user.setUserName(userNickNameArray[i]);
			user.setNickName(userNickNameArray[i]);
			user.setQq(userQQArray[i]);
			user.setUserOrder(userOrder);
			user.setRoleId(roleId);
			System.out.println(insertSql(num++, user.getUid(), user.getUserName(), user.getNickName(), user.getQq(),
					user.getUserOrder(), user.getRoleId()));
		}
	}

	private static void initAdminUser() {
		String userQQArray[] = { "315898519", "815898519", "2589865500", "2589866688", "2512111267", "2589865511",
				"2589865577", "2589866611", "2589869911", "515898519", "315898519", "760549735", "815898519" };
		String userNickNameArray[] = { "总监", "管理员", "百合老师", "海葵老师", "励文老师", "刘老师", "龙恩老师", "星辰老师", "赵老师", "客服小雪",
				"客服小薇", "客服小鱼", "客服夏夏" };
		// String userNameArray[] = { "zongjian", "guanliyuan", "baihelaoshi",
		// "haikuilaoshi", "liwenlaoshi", "liulaoshi",
		// "longenlaoshi", "xinchenlaoshi", "zhaolaoshi", "kefuxiaoxue",
		// "kefuxiaowei", "kefuxiaoyu",
		// "kefuxiaxia" };
		int userOrder = 1;
		int roleId = 1;
		for (int i = 0; i < 2; i++) {
			User user = new User();
			user.setUid(UUIDGenerator.getUUID());
			user.setUserName(userNickNameArray[i]);
			user.setNickName(userNickNameArray[i]);
			user.setQq(userQQArray[i]);
			user.setUserOrder(userOrder);
			user.setRoleId(roleId);
			System.out.println(insertSql(num++, user.getUid(), user.getUserName(), user.getNickName(), user.getQq(),
					user.getUserOrder(), user.getRoleId()));
		}
		userOrder = 5;
		roleId = 2;
		for (int i = 2; i < userQQArray.length - 4; i++) {
			User user = new User();
			user.setUid(UUIDGenerator.getUUID());
			user.setUserName(userNickNameArray[i]);
			user.setNickName(userNickNameArray[i]);
			user.setQq(userQQArray[i]);
			user.setUserOrder(userOrder);
			user.setRoleId(roleId);
			System.out.println(insertSql(num++, user.getUid(), user.getUserName(), user.getNickName(), user.getQq(),
					user.getUserOrder(), user.getRoleId()));
		}
		userOrder = 10;
		roleId = 3;
		for (int i = userQQArray.length - 4; i < userQQArray.length; i++) {
			User user = new User();
			user.setUid(UUIDGenerator.getUUID());
			user.setUserName(userNickNameArray[i]);
			user.setNickName(userNickNameArray[i]);
			user.setQq(userQQArray[i]);
			user.setUserOrder(userOrder);
			user.setRoleId(roleId);
			System.out.println(insertSql(num++, user.getUid(), user.getUserName(), user.getNickName(), user.getQq(),
					user.getUserOrder(), user.getRoleId()));
		}
	}

	private static String insertSql(int id, String uid, String userName, String nickName, String qq, int userOrder,
			int roleId) {
		return "INSERT INTO t_user VALUES ('" + id + "', '" + uid + "', '" + userName + "', 'caifu108', '" + nickName
				+ "', '', '" + qq + "', '" + userOrder + "', '0', '0', '" + roleId
				+ "', '127.0.0.1', '2017-02-09 21:09:02', 'skin0', '0', '" + qq + "@qq.com');";
	}

	private static String insertSql(int id, String uid, String userName, String pw, String nickName, String qq,
			int userOrder, int roleId) {
		return "INSERT INTO t_user VALUES ('" + id + "', '" + uid + "', '" + userName + "', '" + pw + "', '" + nickName
				+ "', '', '" + qq + "', '" + userOrder + "', '0', '0', '" + roleId
				+ "', '127.0.0.1', '2017-02-09 21:09:02', 'skin0', '0', '" + qq + "@qq.com');";
	}
}
