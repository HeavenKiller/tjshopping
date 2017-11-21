package tjweb.tools;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

public class Delfile {    
    
	 /**  
	  * 删除某个文件夹下的所有文件夹和文件  
	  *  
	  * @param delpath  
	  *            String  
	  * @throws FileNotFoundException  
	  * @throws IOException  
	  * @return boolean  
	  */    
	 public static boolean deletefile(String delpath) throws Exception {    
	  try {    
	    
	   File file = new File(delpath);    
	   // 当且仅当此抽象路径名表示的文件存在且 是一个目录时，返回 true    
	   if (!file.isDirectory()) {    
	    file.delete();    
	   } else if (file.isDirectory()) {    
	    String[] filelist = file.list();    
	    for (int i = 0; i < filelist.length; i++) {    
	     File delfile = new File(delpath + "\\" + filelist[i]);    
	     if (!delfile.isDirectory()) {    
	      delfile.getAbsoluteFile().delete();  
	      System.out  .println(delfile.getAbsolutePath() + "删除文件成功");    
	     } else if (delfile.isDirectory()) {    
	      deletefile(delpath + "\\" + filelist[i]);    
	     }    
	    }    
	    System.out.println(file.getAbsolutePath()+"删除成功");    
	    file.getAbsoluteFile().delete();  
	   }    
	    
	  } catch (FileNotFoundException e) {    
	   System.out.println("deletefile() Exception:" + e.getMessage());    
	  }    
	  return true;    
	 }    
	    
	 /**  
	  * 输出某个文件夹下的所有文件夹和文件路径  
	  *  
	  * @param delpath  
	  *            String  
	  * @throws FileNotFoundException  
	  * @throws IOException  
	  * @return boolean  
	  */    
	 public static boolean readfile(String filepath)    
	   throws FileNotFoundException, IOException {    
	  try {    
	    
	   File file = new File(filepath);    
	   System.out.println("遍历的路径为：" + file.getAbsolutePath());    
	   // 当且仅当此抽象路径名表示的文件存在且 是一个目录时（即文件夹下有子文件时），返回 true    
	   if (!file.isDirectory()) {    
	    System.out.println("该文件的绝对路径：" + file.getAbsolutePath());    
	    System.out.println("名称：" + file.getName());    
	   } else if (file.isDirectory()) {    
	    // 得到目录中的文件和目录    
	    String[] filelist = file.list();    
	    if (filelist.length == 0) {    
	     System.out.println(file.getAbsolutePath()    
	       + "文件夹下，没有子文件夹或文件");    
	    } else {    
	     System.out    
	       .println(file.getAbsolutePath() + "文件夹下，有子文件夹或文件");    
	    }    
	    for (int i = 0; i < filelist.length; i++) {    
	     File readfile = new File(filepath + "\\" + filelist[i]);    
	     System.out.println("遍历的路径为：" + readfile.getAbsolutePath());    
	     if (!readfile.isDirectory()) {    
	      System.out.println("该文件的路径："    
	        + readfile.getAbsolutePath());    
	      System.out.println("名称：" + readfile.getName());    
	     } else if (readfile.isDirectory()) {    
	      System.out.println("-----------递归循环-----------");    
	      readfile(filepath + "\\" + filelist[i]);    
	     }    
	    }    
	    
	   }    
	    
	  } catch (FileNotFoundException e) {    
	   System.out.println("readfile() Exception:" + e.getMessage());    
	  }    
	  return true;    
	 }    
	}
