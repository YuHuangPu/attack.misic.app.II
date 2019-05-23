package com.ama.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class EncodingFilter implements Filter {
	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)req;
        String URI = httpRequest.getRequestURI();
 
        if (URI.endsWith(".gif") || URI.endsWith(".jpg")) {
            chain.doFilter(req, resp); 
        }else if(URI.endsWith(".css")) {
    		resp.setContentType("text/css");
            chain.doFilter(req, resp);
        } else {
    		req.setCharacterEncoding("UTF-8");
    		resp.setContentType("text/html; charset=UTF-8");
    		chain.doFilter(req, resp);
        }
	}

	public void init(FilterConfig config) throws ServletException {
	}
}
