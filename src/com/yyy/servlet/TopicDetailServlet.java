package com.yyy.servlet;

import java.io.File;
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

import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.client.Result;

import com.yyy.dao.HBaseDAO;
import com.yyy.json.ARTICLE_TOPIC20Json;
import com.yyy.json.TOPIC_WORD100tsv;
import com.yyy.model.IndexProb;

/**
 * Servlet implementation class TopicDetailServlet
 */
@WebServlet("/topicDetail")
public class TopicDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String WEBCONTENT_PATH = "";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TopicDetailServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		WEBCONTENT_PATH = request.getSession().getServletContext().getRealPath("");

		String index = request.getParameter("topicindex");
		index = index.length() == 1 ? "0" + index : index;
		String strJsonFileName = "topic_" + index + "_word100" + ".tsv";
		// create article_topic json file
		TOPIC_WORD100tsv twtsv = new TOPIC_WORD100tsv();
		twtsv.create(index, WEBCONTENT_PATH + File.separator + "data" + File.separator + strJsonFileName);

		request.setAttribute("index", index);
		request.setAttribute("filepath", "data" + File.separator + strJsonFileName);
		request.getRequestDispatcher("topic_detail.jsp").forward(request, response);
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
