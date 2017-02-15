package mingxin;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class Test {
	public static void main(String[] args) {
		Test t = new Test();
		JSONObject sourceJson = t.sourceJson(); // 数据源
		// System.out.println(sourceJson.toJSONString());
		JSONObject tempJson = t.tempJson();// 数据模板
		 System.out.println(tempJson.toJSONString());
		// System.out.println(targetJson().toJSONString());
		// t.deal(sourceJson, tempJson, null);
		t.newDeal(sourceJson, tempJson);
//		System.out.println(tempJson.toJSONString());
	}

	public void newDeal(JSONObject sourceJson, JSONObject tempJson) {
		JSONArray resultArray = new JSONArray();
		for (String key : tempJson.keySet()) {
			Object value = tempJson.get(key);
			if (value instanceof String) {
				String pathValue = (String) value;
				String[] pathArray = pathValue.split("[.]");
				List<Object> resultList = new ArrayList<Object>();
				newDealObj(sourceJson, tempJson, 0, pathArray, key, resultList);
				System.out.println("数组长度"+resultList.size());
				for (int i = 0; i < resultList.size(); i++) {
					JSONObject obj = null;
					if (i < resultArray.size()) {
						obj = resultArray.getJSONObject(i);
					} else {
						obj = new JSONObject();
						resultArray.add(obj);
					}
					obj.put(key, resultList.get(i));
				}
			}
		}
		System.out.println(resultArray.toJSONString());
	}

	public void newDealObj(JSONObject sourceObj, JSONObject tempJson, int n, String[] pathArray, String key,
			List<Object> resultList) {
		if (n >= pathArray.length) {
			return;
		}
		Object obj = sourceObj.get(pathArray[n]);
		if (obj == null) {
			return;
		}
		if (obj instanceof JSONObject) {
			newDealObj((JSONObject) obj, tempJson, ++n, pathArray, key, resultList);
		} else if (obj instanceof JSONArray) {
			JSONArray childArray = (JSONArray) obj;
			int num = ++n;
			for (int i = 0; i < childArray.size(); i++) {
				newDealObj(childArray.getJSONObject(i), tempJson,num, pathArray, key, resultList);
			}
		} else {
			resultList.add(obj);
			// tempJson.put(key, obj,resultList);
		}
	}

	public void deal(JSONObject sourceJson, JSONObject tempJson, Object parentObj) {

		for (String key : tempJson.keySet()) {
			Object value = tempJson.get(key);
			if (value instanceof String) {
				String pathValue = (String) value;
				String[] pathArray = pathValue.split("[.]");
				dealObj(sourceJson, tempJson, 0, pathArray, key, parentObj);
			} else if (value instanceof JSONObject) {
				deal(sourceJson, (JSONObject) value, tempJson);
			} else if (value instanceof JSONArray) {
				// 如果数组 就要构造多个 先用第一个处理
				JSONArray childArray = (JSONArray) value;
				deal(sourceJson, childArray.getJSONObject(0), childArray);
			}
			// String pathValue = tempJson.getString(key);
			// String[] pathArray = pathValue.split("[.]");
			// for(int i=0;i<pathArray.length;i++){
			// Object obj = sourceJson.get(pathArray[i]);
			// if(obj == null){
			// continue;
			// }
			// if(obj instanceof JSONObject){
			// tempJson.put(key,dealObj((JSONObject)obj, tempJson,i,pathArray));
			// }else if(obj instanceof JSONArray){
			// JSONArray childArray = (JSONArray)obj;
			// if(i==pathArray.length-1){
			// //路径到最后 value 就是array
			// tempJson.put(key,childArray);
			// }else{
			// //TODO 如果是数组 暂时去第一个 处理
			// Object fristObj = childArray.get(0);
			// if(fristObj instanceof JSONObject){
			// tempJson.put(key,dealObj((JSONObject)fristObj,
			// tempJson,i+1,pathArray));
			// }else{
			// System.out.println("暂不处理的类型 "+fristObj);
			// }
			// }
			// }else{
			// tempJson.put(key, obj);
			// }
			// }
		}

	}

	public void dealObj(JSONObject sourceObj, JSONObject tempJson, int n, String[] pathArray, String key,
			Object parentObj) {
		if (n >= pathArray.length) {
			return;
		}
		Object obj = sourceObj.get(pathArray[n]);
		if (obj == null) {
			return;
		}
		if (obj instanceof JSONObject) {
			dealObj((JSONObject) obj, tempJson, ++n, pathArray, key, parentObj);
		} else if (obj instanceof JSONArray) {
			JSONArray childArray = (JSONArray) obj;
			if (n == pathArray.length - 1) {
				// 路径到最后 value 就是array
				tempJson.put(key, obj);
			} else {
				// TODO 如果是数组 暂时去第一个 处理

				// Object childObj = childArray.get(0);
				// if(childObj instanceof JSONObject){
				// dealObj((JSONObject)childObj, tempJson,++n,pathArray,key);
				// }else{
				// System.out.println("暂不处理的类型 "+childObj);
				// }

				int num = ++n;
				JSONArray parentArray = null;
				if (parentObj instanceof JSONArray) {
					parentArray = (JSONArray) parentObj;
				}
				for (int i = 0; i < childArray.size(); i++) {
					Object childObj = childArray.get(i);

					if (childObj instanceof JSONObject) {
						Object tmpObj = null;
						if (parentArray != null && parentArray.size() > i) {
							tmpObj = parentArray.get(i);
						}
						JSONObject newTempObj = (JSONObject) tempJson;
						if (tmpObj == null) {
							if (parentArray != null) {
								newTempObj = JSONObject.parseObject(tempJson.toJSONString());
								parentArray.add(newTempObj);
							}
						} else {
							newTempObj = (JSONObject) tmpObj;
						}

						dealObj((JSONObject) childObj, newTempObj, num, pathArray, key, parentObj);
					} else {
						System.out.println("暂不处理的类型 " + childObj);
					}

					// if(i==0){
					// if(childObj instanceof JSONObject){
					// dealObj((JSONObject)childObj,
					// tempJson,num,pathArray,key,parentObj);
					// }else{
					// System.out.println("暂不处理的类型 "+childObj);
					// }
					// }else{
					// if(childObj instanceof JSONObject){
					// if(parentArray!=null){
					// JSONObject newTempObj =
					// JSONObject.parseObject(tempJson.toJSONString());
					// parentArray.add(newTempObj);
					// dealObj((JSONObject)childObj,
					// newTempObj,num,pathArray,key,parentObj);
					// }else{
					// dealObj((JSONObject)childObj,
					// tempJson,num,pathArray,key,parentObj);
					// }
					//
					// }else{
					// System.out.println("暂不处理的类型 "+childObj);
					// }
					// }
					//
				}
				//
				// JSONArray tempChildArray = new JSONArray();
				// int num = ++n;
				// for(int i=0;i<childArray.size();i++){
				// Object childObj = childArray.get(i);
				// JSONObject newTempJson =
				// JSONObject.parseObject(tempJson.toJSONString());
				// if(childObj instanceof JSONObject){
				// dealObj((JSONObject)childObj, newTempJson,num,pathArray,key);
				// }else{
				// System.out.println("暂不处理的类型 "+childObj);
				// }
				// tempChildArray.add(newTempJson);
				// }
				// tempJson.put(key, tempChildArray);
			}
		} else {
			tempJson.put(key, obj);
		}
	}

	public JSONObject sourceJson() {
		JSONObject obj = new JSONObject();
		JSONArray teacheArray = new JSONArray();
		{
			{
				JSONObject teacheObj = new JSONObject();
				teacheObj.put("t_name", "王老师");
				teacheObj.put("t_age", "30");
				teacheObj.put("t_address", "北京海淀");

				JSONArray classArray = new JSONArray();
				{
					JSONObject classobj = new JSONObject();
					classobj.put("name", "一年级一班");
					{
						JSONObject gradeobj = new JSONObject();
						gradeobj.put("name", "一年级");
						{
							JSONObject schoolobj = new JSONObject();
							schoolobj.put("name", "北京四中");
							schoolobj.put("address", "北京西城区");
							gradeobj.put("schoolobj", schoolobj);
						}
						classobj.put("gradeobj", gradeobj);
					}
					classArray.add(classobj);
				}
				teacheObj.put("classArray", classArray);
				teacheArray.add(teacheObj);
			}
			{
				JSONObject teacheObj = new JSONObject();
				teacheObj.put("t_name", "刘老师");
				teacheObj.put("t_age", "50");
				teacheObj.put("t_address", "北京西城");
				JSONArray classArray = new JSONArray();
				{
					JSONObject classobj = new JSONObject();
					classobj.put("name", "一年级一班");
					{
						JSONObject gradeobj = new JSONObject();
						gradeobj.put("name", "一年级");
						{
							JSONObject schoolobj = new JSONObject();
							schoolobj.put("name", "北京四中");
							schoolobj.put("address", "北京西城区");
							gradeobj.put("schoolobj", schoolobj);
						}
						classobj.put("gradeobj", gradeobj);
					}
					classArray.add(classobj);
				}
				{
					JSONObject classobj = new JSONObject();
					classobj.put("name", "一年级二班");
					{
						JSONObject gradeobj = new JSONObject();
						gradeobj.put("name", "一年级");
						{
							JSONObject schoolobj = new JSONObject();
							schoolobj.put("name", "北京四中");
							schoolobj.put("address", "北京西城区");
							gradeobj.put("schoolobj", schoolobj);
						}
						classobj.put("gradeobj", gradeobj);
					}
					classArray.add(classobj);
				}
				teacheObj.put("classArray", classArray);

				teacheArray.add(teacheObj);
			}
		}
		obj.put("teacheArray", teacheArray);
		return obj;
	}

	public JSONObject tempJson() {
		JSONObject schoolobj = new JSONObject();
		schoolobj.put("name", "teacheArray.classArray.gradeobj.schoolobj.name");
		schoolobj.put("address", "teacheArray.classArray.gradeobj.schoolobj.address");
		{
			JSONArray gradeArray = new JSONArray();
			{
				JSONObject gradeobj = new JSONObject();
				gradeobj.put("name", "teacheArray.classArray.gradeobj.name");
				{
					JSONArray classArray = new JSONArray();
					{
						JSONObject classobj = new JSONObject();
						classobj.put("name", "teacheArray.classArray.name");
						{
							JSONArray teacheArray = new JSONArray();
							{
								{
									JSONObject teacheObj = new JSONObject();
									teacheObj.put("name", "teacheArray.t_name");
									teacheObj.put("age", "teacheArray.t_age");
									teacheObj.put("adress", "teacheArray.t_address");
									teacheArray.add(teacheObj);
								}

							}
							classobj.put("teacheArray", teacheArray);
						}
						classArray.add(classobj);
					}
					gradeobj.put("classArray", classArray);
				}
				gradeArray.add(gradeobj);
			}
			schoolobj.put("gradeArray", gradeArray);
		}
		return schoolobj;
	}

	public JSONObject targetJson() {
		JSONObject schoolobj = new JSONObject();
		schoolobj.put("name", "北京四中");
		schoolobj.put("address", "北京西城区");
		{
			JSONArray gradeArray = new JSONArray();
			{
				JSONObject gradeobj = new JSONObject();
				gradeobj.put("name", "一年级");
				{
					JSONArray classArray = new JSONArray();
					{
						JSONObject classobj = new JSONObject();
						classobj.put("name", "一年级一班");
						{
							JSONArray teacheArray = new JSONArray();
							{
								{
									JSONObject teacheObj = new JSONObject();
									teacheObj.put("name", "王老师");
									teacheObj.put("age", "30");
									teacheObj.put("adress", "北京海淀");
									teacheArray.add(teacheObj);
								}
								{
									JSONObject teacheObj = new JSONObject();
									teacheObj.put("name", "刘老师");
									teacheObj.put("age", "50");
									teacheObj.put("adress", "北京西城");
									teacheArray.add(teacheObj);
								}
							}
							classobj.put("teacheArray", teacheArray);
						}
						classArray.add(classobj);
					}
					gradeobj.put("classArray", classArray);
				}
				gradeArray.add(gradeobj);
			}
			schoolobj.put("gradeArray", gradeArray);
		}
		return schoolobj;
	}
}
