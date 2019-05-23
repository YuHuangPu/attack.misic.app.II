package com.ama.listener;

import java.util.Iterator;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.util.ResourceUtil;

public class InitializedMajorData implements ServletContextListener {

	static final Logger logger = LoggerFactory.getLogger(InitializedMajorData.class);

	public void contextInitialized(ServletContextEvent sce) {
		ServletContext context = sce.getServletContext();
		try {
			ResourceBundle config = ResourceUtil.retrieveProperties("config");
			for (Iterator<String> itrs = config.keySet().iterator(); itrs != null && itrs.hasNext();) {
				String k = itrs.next();
				context.setAttribute(k, config.getString(k));
			}

		} catch (Exception e) {
			throw new RuntimeException(e.toString());
		}
	}

	public void contextDestroyed(ServletContextEvent sce) {
		logger.debug("...");
	}

}
