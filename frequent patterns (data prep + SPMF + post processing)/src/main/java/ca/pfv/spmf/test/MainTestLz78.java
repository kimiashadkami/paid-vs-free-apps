package ca.pfv.spmf.test;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;

import ca.pfv.spmf.algorithms.sequenceprediction.ipredict.database.Item;
import ca.pfv.spmf.algorithms.sequenceprediction.ipredict.database.Sequence;
import ca.pfv.spmf.algorithms.sequenceprediction.ipredict.database.SequenceDatabase;
import ca.pfv.spmf.algorithms.sequenceprediction.ipredict.database.SequenceStatsGenerator;
import ca.pfv.spmf.algorithms.sequenceprediction.ipredict.predictor.Predictor;
import ca.pfv.spmf.algorithms.sequenceprediction.ipredict.predictor.LZ78.LZ78Predictor;

/**
 * Example of how to use the LZ78 sequence prediction model in the source code.
 * Copyright 2015.
 */
public class MainTestLz78 {

	public static void main(String [] arg) throws IOException, ClassNotFoundException{
		
		// Load the set of training sequences
		String inputPath = fileToPath("contextCPT.txt");  
		SequenceDatabase trainingSet = new SequenceDatabase();
		trainingSet.loadFileSPMFFormat(inputPath, Integer.MAX_VALUE, 0, Integer.MAX_VALUE);
		
		// Print the training sequences to the console
		System.out.println("--- Training sequences ---");
		for(Sequence sequence : trainingSet.getSequences()) {
			System.out.println(sequence.toString());
		}
		System.out.println();
		
		
		// Print statistics about the training sequences
		SequenceStatsGenerator.prinStats(trainingSet, " Statistics about training sequences ");
		
		// Train the prediction model
		LZ78Predictor predictionModel = new LZ78Predictor("LZ78");
		predictionModel.Train(trainingSet.getSequences());
		
		// Now we will make a prediction.
		// We want to predict what would occur after the sequence <1, 3>.
		// We first create the sequence
		Sequence sequence = new Sequence(0);
		sequence.addItem(new Item(1));
		sequence.addItem(new Item(4));
		
		// Then we perform the prediction
		System.out.println("--- Prediction ---");
		Sequence thePrediction = predictionModel.Predict(sequence);
		System.out.println("For the sequence <(1),(4)>, the prediction for the next symbol is: +" + thePrediction);
		
		// ======================== OPTIONAL ==============================================
		// *******  IF we want to save the trained model to a file ******* ///
		ObjectOutputStream stream = new ObjectOutputStream(new FileOutputStream("model.ser"));
		stream.writeObject(predictionModel);
		stream.close();
		
		// ****** Then, we can also load the trained model from the file ****** ///
		ObjectInputStream stream2 = new ObjectInputStream(new FileInputStream("model.ser"));
		Predictor predictionModel2 = (Predictor) stream2.readObject();
		stream.close();
		// and then make a prediction
		Sequence thePrediction2 = predictionModel2.Predict(sequence);
		System.out.println("For the sequence <(1),(4)>, the prediction for the next symbol is: +" + thePrediction2);
	}
	
	public static String fileToPath(String filename) throws UnsupportedEncodingException{
		URL url = MainTestLz78.class.getResource(filename);
		 return java.net.URLDecoder.decode(url.getPath(),"UTF-8");
	}
}
