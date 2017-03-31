package com.yyy.listener;

import java.io.File;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.mechaglot_Alpha2.controller.Calculate;
import com.yyy.dao.HBaseDAO;
import com.yyy.dao.HBaseUtils;

import edu.stanford.nlp.Tagging;

/**
 * Application Lifecycle Listener implementation class StartupListener
 *
 */
@WebListener
public class StartupListener implements ServletContextListener {

	/**
	 * Default constructor.
	 */
	public StartupListener() {
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent arg0) {
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent arg0) {
		HBaseUtils.init();
		HBaseDAO.init();
		//init resource path
		String resourcePath = arg0.getServletContext().getRealPath("/") + "resource" + File.separator;
		Tagging.init(resourcePath);
		Calculate.init(resourcePath);
	}

}
