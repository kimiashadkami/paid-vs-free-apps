package ca.pfv.spmf.test;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;

import ca.pfv.spmf.algorithms.frequentpatterns.HUIM_AF.AlgoHUIM_AF;
import ca.pfv.spmf.algorithms.frequentpatterns.HUIM_GA.AlgoHUIM_GA;


/**
 * Example of how to use the HUIM-AF algorithm 
 * from the source code.
 * @author Song et al., 2021
 */
public class MainTestHUIM_AF {

	public static void main(String [] arg) throws IOException{
		
		String input = fileToPath("contextHUIM.txt");
		
		String output = ".//output.txt";

		int min_utility = 40;  // 
		
		// Applying the huim_bpso algorithm
		AlgoHUIM_AF algorithm = new AlgoHUIM_AF();
		algorithm.runAlgorithm(input, output, min_utility);
		algorithm.printStats();

	}

	public static String fileToPath(String filename) throws UnsupportedEncodingException{
		URL url = MainTestHUIM_AF.class.getResource(filename);
		 return java.net.URLDecoder.decode(url.getPath(),"UTF-8");
	}
}
