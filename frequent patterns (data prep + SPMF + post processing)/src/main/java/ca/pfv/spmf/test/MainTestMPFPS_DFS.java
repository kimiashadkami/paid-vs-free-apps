package ca.pfv.spmf.test;

import java.io.UnsupportedEncodingException;
import java.net.URL;

import ca.pfv.spmf.algorithms.frequentpatterns.mpfps.AlgoMPFPS_DFS;

/* This file is copyright (c) 2019 Zhitian Li, Philippe Fournier-Viger
 * 
 * This file is part of the SPMF DATA MINING SOFTWARE
 * (http://www.philippe-fournier-viger.com/spmf).
 * 
 * SPMF is free software: you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 * 
 * SPMF is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 * You should have received a copy of the GNU General Public License along with
 * SPMF. If not, see <http://www.gnu.org/licenses/>.
 * 
 */
/**
 * This is an example of how to use the MPFPS_DFS algorithm using the source
 * code of SPMF.
 * 
 * @see AlgoMPFPS_DFS
 * @author Zhitian Li, Philippe Fournier-Viger
 **/
public class MainTestMPFPS_DFS {

	public static void main(String[] args) throws Exception {

		// Max standard deviation
		double maxStandardDeviation = 10;

		// Min RA
		double minRA = 0.25;

		// Max periodicity
		int maxPeriodicity = 10;

		// Minimum support
		int minimumSupport = 2;
		
		// Input file
		String inputFile = fileToPath("contextPrefixSpan.txt");

		// Output file path
		String outputFile = "output.txt";

		// Run the algorithm
		AlgoMPFPS_DFS algorithm = new AlgoMPFPS_DFS();
		algorithm.runAlgorithm(maxStandardDeviation, minRA, maxPeriodicity,
				minimumSupport, inputFile, outputFile);
		algorithm.printStats();

	}

	public static String fileToPath(String filename)
			throws UnsupportedEncodingException {
		System.out.println("filename : " + filename);
		URL url = MainTestMPFPS_DFS.class.getResource(filename);
		return java.net.URLDecoder.decode(url.getPath(), "UTF-8");
	}
}
