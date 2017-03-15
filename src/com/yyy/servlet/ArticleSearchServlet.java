package com.yyy.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.client.Result;

import com.yyy.dao.HBaseDAO;
import com.yyy.model.IndexProb;

/**
 * Servlet implementation class ArticleSearch
 */
@WebServlet("/articleSearch")
public class ArticleSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final double MIN_PR = 0.01;
	private static final String TOPIC_TABLENAME = "ARTICLE_TOPIC";
	private static final String CONTENT_TABLENAME = "ARTICLE_ALIAS_TITLE_CONTENT";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArticleSearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		String title = request.getParameter("search");
		String index = request.getParameter("index");
		List<IndexProb> topics = getTopic(index);

		List<String> topicIndex = new ArrayList<String>();
		List<String> topicPr = new ArrayList<String>();
		for (IndexProb topic : topics) {
			if (topic.getProb() > MIN_PR) {
				topicIndex.add(topic.getIndex());
				topicPr.add(String.valueOf(topic.getProb()).substring(0, 5));
			}
		}
		request.setAttribute("articleIndex", index);

		// set article title and content
		request.setAttribute("title", title);
		System.out.println(title);
		request.setAttribute("content", getContent(index));
		// set topicIndex and Pr
		request.setAttribute("topicIndex", topicIndex);
		request.setAttribute("topicPr", topicPr);

		request.getRequestDispatcher("article_search.jsp").forward(request, response);
	}

	private List<IndexProb> getTopic(String index) throws IOException {
		List<IndexProb> topics = new ArrayList<IndexProb>();

		Result result = HBaseDAO.get(TOPIC_TABLENAME, index);
		NavigableMap<byte[], byte[]> navigableMap = result.getFamilyMap("topic".getBytes());
		Set<Entry<byte[], byte[]>> set = navigableMap.entrySet();
		for (Entry<byte[], byte[]> entry : set) {
			// System.out.println(new String(entry.getKey()) + "-" + new
			// String(entry.getValue()));
			topics.add(new IndexProb(new String(entry.getKey()), new String(entry.getValue())));
		}
		Collections.sort(topics);
		return topics;
	}

	private String getContent(String index) throws IOException {
		Result result = HBaseDAO.get(CONTENT_TABLENAME, index);
		Cell cell = result.getColumnLatestCell("article".getBytes(), "content".getBytes());
		System.out.println(new String(CellUtil.cloneValue(cell)));
		return new String(CellUtil.cloneValue(cell));
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
