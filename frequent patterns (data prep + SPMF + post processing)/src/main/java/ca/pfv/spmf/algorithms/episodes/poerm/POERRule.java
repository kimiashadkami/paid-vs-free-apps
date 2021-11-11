package ca.pfv.spmf.algorithms.episodes.poerm;

import java.util.List;

/* This file is copyright (c) 2021  CHEN YANGMING, Philippe Fournier-Viger
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
*/

/**
* This is an auxiliary data structure of the "POERM and POERM-ALL" algorithm, 
* This is used to record a Partially-Ordered Episode Rule <br/>
* <br/>
*
* Paper: Mining Partially-Ordered Episode Rules in an Event Sequence
* @see POERMALL
* @see AlgoPOERM
*/
public class POERRule {
	/** the antiEpisode of a Partially-Ordered Episode Rule*/
	private List<Integer> antiEpisode;
	
	/** the conseEpisode of a Partially-Ordered Episode Rule*/
	private List<Integer> conseEpisode;
	
	/** the appear time interval of a Partially-Ordered Episode Rule*/
	private List<Interval> intervals;
	
	/** the antiEpisode appear time of a Partially-Ordered Episode Rule*/
	private int antiCount;
	
	/** the confident of a Partially-Ordered Episode Rule*/
	private int confidence;
	
	public POERRule(List<Integer> antiEpisode, 
			List<Integer> conseEpisode, List<Interval> intervals, 
			int antiCount, int confident) {
		this.setAntiEpisode(antiEpisode);
		this.setConseEpisode(conseEpisode);
		this.setIntervals(intervals);
		this.setAntiCount(antiCount);
		this.setConfident(confident);
	}
	public List<Integer> getAntiEpisode() {
		return antiEpisode;
	}
	public void setAntiEpisode(List<Integer> antiEpisode) {
		this.antiEpisode = antiEpisode;
	}
	public List<Integer> getConseEpisode() {
		return conseEpisode;
	}
	public void setConseEpisode(List<Integer> conseEpisode) {
		this.conseEpisode = conseEpisode;
	}
	public List<Interval> getIntervals() {
		return intervals;
	}
	public void setIntervals(List<Interval> intervals) {
		this.intervals = intervals;
	}
	public int getRuleCount() {
		return confidence;
	}
	public void setConfident(int confident) {
		this.confidence = confident;
	}
	public int getAntiCount() {
		return antiCount;
	}
	public void setAntiCount(int antiCount) {
		this.antiCount = antiCount;
	}
}
