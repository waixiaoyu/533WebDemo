package com.yyy.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.yyy.fuzzsearch.FindRelatedArticleId;
import com.yyy.fuzzsearch.FuzzSearch;
import com.yyy.model.ArticleMeasure;
import com.yyy.model.WordTopicProb;

import edu.stanford.nlp.Tagging;

/**
 * Servlet implementation class ArticleSearch
 */
@WebServlet("/articleFuzzSearch")
public class ArticleFuzzSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArticleFuzzSearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) throws IOException {
		ArticleFuzzSearchServlet a = new ArticleFuzzSearchServlet();
		String sentence = "";
		if (StringUtils.isEmpty(sentence) || sentence.equals("test")) {
			sentence = "Showers continued throughout the week in the Bahia cocoa zone.";
		}

		List<ArticleMeasure> lAMs = a.fuzzSearch(sentence);
		for (ArticleMeasure articleMeasure : lAMs) {
			System.out.println(articleMeasure.getMaxId());
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		String sentence = request.getParameter("search");
		if (StringUtils.isEmpty(sentence) || sentence.equals("test")) {
			sentence = "Showers continued throughout the week in the Bahia cocoa zone.";
		}

		List<ArticleMeasure> lAMs = fuzzSearch(sentence);

		request.setAttribute("lAMs", lAMs);
		request.setAttribute("sentence", sentence);
		
		
		request.getRequestDispatcher("article_fuzz_search.jsp").forward(request, response);
	}

	/**
	 * mainly procedures about fuzz search are in the following function: Input
	 * Sentence -> tagging words -> related topic -> high related articles under
	 * one topic -> match sentences in one article -> compute score -> sort
	 * articles
	 */
	private List<ArticleMeasure> fuzzSearch(String sent) throws IOException {
		// tagging the input sentence, use "NN"
		Tagging t = new Tagging();
		List<String> l = t.searchByTag(sent, "NN");

		// find the relation between words and topics
		List<WordTopicProb> wtps = new LinkedList<WordTopicProb>();
		for (String str : l) {
			wtps.add(new WordTopicProb(str));
		}

		/**
		 * according to input, find the most related topic.
		 * WordTopicProb=wordid+topicid+prob of word in one topic
		 */
		FindRelatedArticleId f = new FindRelatedArticleId();
		f.getHighestProbInTopic(wtps);
		Iterator<WordTopicProb> it = wtps.iterator();
		// eliminate invalid word
		while (it.hasNext()) {
			WordTopicProb wordTopicProb = (WordTopicProb) it.next();
			if (StringUtils.isEmpty(wordTopicProb.getTopicId())) {
				it.remove();
			}
		}
		System.out.println(wtps);// valid word and its topic

		// according to topic find the related article under topics
		Set<String> setId = f.searchArticleId(wtps);
		System.out.println(setId);

		FuzzSearch fs = new FuzzSearch();
		List<ArticleMeasure> lAms = new ArrayList<ArticleMeasure>();

		// add each AM to list
		for (String id : setId) {
			ArticleMeasure am = fs.getArticleAMById(id);
			if (am != null) {
				// computing the score for every sentence for one artile
				lAms.add(fs.matchArticle(sent, am));
			}
		}
		// sort by max score
		lAms.sort(new Comparator<ArticleMeasure>() {
			public int compare(ArticleMeasure o1, ArticleMeasure o2) {
				return (int) Math.signum(o2.getMaxScore() - o1.getMaxScore());
			}
		});
		return lAms;
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
