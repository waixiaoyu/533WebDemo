package com.yyy.model;

public class IndexProb implements Comparable<IndexProb> {
	String index;
	double prob;

	public String getIndex() {
		return index;
	}

	public void setIndex(String index) {
		this.index = index;
	}

	public double getProb() {
		return prob;
	}

	public void setProb(double prob) {
		this.prob = prob;
	}

	public IndexProb(String nIndex, double dProbility) {
		super();
		this.index = nIndex;
		this.prob = dProbility;
	}

	public IndexProb(String nIndex, String dProbility) {
		super();
		this.index = nIndex;
		this.prob = conversion(dProbility);
	}

	public int compareTo(IndexProb o) {
		if (o.prob > this.prob)
			return 1;
		else
			return -1;
	}

	public static void main(String[] args) {
	}

	// 将科学计数转换成正常数字
	public double conversion(String str) {
		// System.out.println(str);
		if (str.contains("E-")) {
			String[] s = str.split("E-");
			double num1 = Double.parseDouble(s[0]);
			double num2 = Double.parseDouble(s[1]);
			return num1 * Math.pow(0.1, num2);
		} else {
			return Double.parseDouble(str);
		}

	}

	@Override
	public String toString() {
		return "IndexProb [index=" + index + ", prob=" + prob + "]";
	}
}
