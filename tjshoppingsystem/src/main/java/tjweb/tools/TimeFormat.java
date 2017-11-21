package tjweb.tools;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeFormat {

	public static String dateToString(Date date) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String sdf;
		
		sdf = df.format(date);
		
		return sdf;
 	}
	
	public static String timeStampToString(Timestamp timestamp) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String sdf;
		
		sdf = df.format(timestamp);
		
		return sdf;
 	}
}
