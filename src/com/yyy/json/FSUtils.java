package com.yyy.json;

import java.io.File;

public class FSUtils {
	public static void delete(String path) {
		File f = new File(path);
		if (f.exists()) {
			f.delete();
			 System.out.println(path+" deleted");
		} else {
			 System.out.println(path+" not exist");
		}
	}
}
