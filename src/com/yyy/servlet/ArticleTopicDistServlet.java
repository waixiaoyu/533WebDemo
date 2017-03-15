package com.yyy.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyy.json.ARTICLE_TOPIC20Json;

/**
 * Servlet implementation class ArticleTopicDistServlet
 */
@WebServlet("/articleTopicDist")
public class ArticleTopicDistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String WEBCONTENT_PATH = "";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArticleTopicDistServlet() {
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

		System.out.println(WEBCONTENT_PATH);
		String index = request.getParameter("articleIndex");
		String strJsonFileName = "article_" + index + "_topic20" + ".json";
		// create article_topic json file
		ARTICLE_TOPIC20Json atjson = new ARTICLE_TOPIC20Json();
		atjson.create(index, WEBCONTENT_PATH  + "data" + File.separator + strJsonFileName);

		request.setAttribute("index", index);
		request.setAttribute("filepath", "data" + File.separator + strJsonFileName);
		request.getRequestDispatcher("article_topic_dist.jsp").forward(request, response);

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
