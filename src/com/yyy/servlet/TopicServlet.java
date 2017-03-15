package com.yyy.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.NavigableMap;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.client.Result;
import org.json.JSONArray;
import org.json.JSONObject;

import com.yyy.dao.HBaseDAO;
import com.yyy.json.JsonUtils;
import com.yyy.model.IndexProb;
import com.yyy.model.WordProb;

/**
 * Servlet implementation class TopicServlet
 */
@WebServlet("/topic")
public class TopicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String TABLENAME = "TOPIC_WORD5";
	private static String WEBCONTENT_PATH = "";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TopicServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		WEBCONTENT_PATH = request.getSession().getServletContext().getRealPath("");

		String strWordSearchPath = WEBCONTENT_PATH + File.separatorChar + "topic_list.json";

		List<String> listTopicIndex = new ArrayList<String>();
		List<List<WordProb>> listWP = new ArrayList<List<WordProb>>();
		List<Result> results = HBaseDAO.scanRowKeyByFilter(TABLENAME, null);
		for (int i = 0; i < results.size(); i++) {
			Result result = results.get(i);
			listTopicIndex.add(new String(result.getRow()));

			List<WordProb> list = new ArrayList<WordProb>();
			NavigableMap<byte[], byte[]> navigableMap = result.getFamilyMap("word".getBytes());
			for (Entry<byte[], byte[]> entry : navigableMap.entrySet()) {
				result = HBaseDAO.get("ID_WORD", new String(entry.getKey()));
				String strKey = new String(CellUtil.cloneValue(result.getColumnLatestCell("word".getBytes(), null)));
				System.out.println(strKey + "-" + new String(entry.getValue()));
				list.add(new WordProb(strKey, new String(entry.getValue())));
			}
			listWP.add(list);
		}

		createTopicListJson(listTopicIndex, listWP, strWordSearchPath);

		request.setAttribute("topicNumber", listTopicIndex.size());
		request.getRequestDispatcher("topic.jsp").forward(request, response);

	}

	private void createTopicListJson(List<String> listTopicIndex, List<List<WordProb>> lists, String path) {
		JSONArray jArray = new JSONArray();
		for (int i = 0; i < listTopicIndex.size(); i++) {
			JSONObject jObj = new JSONObject();
			jObj.put("index", listTopicIndex.get(i));
			JSONArray jArrayIndexProb = new JSONArray();
			for (WordProb ip : lists.get(i)) {
				JSONObject jObjIndexProb = new JSONObject();
				jObjIndexProb.put("word", ip.getWord());
				jObjIndexProb.put("pr", ip.getProb());
				jArrayIndexProb.put(jObjIndexProb);
			}
			jObj.put("value", jArrayIndexProb);
			jArray.put(jObj);
		}
		// System.out.println(WEBCONTENT_PATH);
		JsonUtils.write(jArray.toString(), path);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
