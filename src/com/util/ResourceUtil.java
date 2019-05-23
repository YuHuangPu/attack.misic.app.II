package com.util;

import java.util.Properties;
import java.util.ResourceBundle;

public class ResourceUtil {

	public static ResourceBundle retrieveProperties(String name) {
		String customizationConfig = "com.ama.resource." + name;
		ResourceBundle tempBundle = ResourceBundle.getBundle(customizationConfig);
		return tempBundle;
	}
}
