package ca.pfv.spmf.test;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;

import ca.pfv.spmf.algorithms.episodes.poerm.AlgoPOERM;
import ca.pfv.spmf.algorithms.episodes.poerm.AlgoPOERMAll;


/**
 * Example of how to use the POERM algorithm from the source code
 * @author Chen YangMing, Philippe Fournier-Viger
 * @see AlgoPOERM
 */
public class MainTestPOERMALL_without_time {

	public static void main(String[] args) throws IOException {
		// the min support of POERM algorithm
		int minSupport = 3;
		
		// the XSpan of POERM algorithm
		int xSpan = 5;
		
		// the YSpan of POERM algorithm
		int ySpan = 5;
		
		// the min confidence of POERM algorithm
		double minConfidence = 0.5;
		
		// the XYSpan of POERM algorithm
		int xySpan = 5;
		
		// Input file 
		String inputFile = fileToPath("DB_POERM.dat");
		
		// Output file 
		String outputFile = "output.txt";
		
		// If the input file does not contain timestamps, then set this variable to true
        // to automatically assign timestamps as 1,2,3...
		boolean selfIncrement = true;
		
		AlgoPOERMAll poerm = new AlgoPOERMAll();
		poerm.runAlgorithm(inputFile, minSupport, xSpan, ySpan, minConfidence, xySpan, selfIncrement);
		poerm.writeRule2File(outputFile);
		poerm.printStats();
	}
	
	public static String fileToPath(String filename) throws UnsupportedEncodingException{
		URL url = MainTestPOERMALL_without_time.class.getResource(filename);
		return java.net.URLDecoder.decode(url.getPath(),"UTF-8");
	}

}