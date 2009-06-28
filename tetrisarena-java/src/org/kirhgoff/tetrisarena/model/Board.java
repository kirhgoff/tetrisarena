package org.kirhgoff.tetrisarena.model;

import java.util.Arrays;
import java.util.List;

import org.json.JSONBean;

import com.twolattes.json.Entity;
import com.twolattes.json.Value;

@Entity
public class Board extends JSONBean {
	//TODO add generation of ActionScript and Java classes
	@Value
    public int width;

	@Value
	public int height;
    
	@Value
	public int blockSize;

	@Value
	public List<Integer>[] cells;
	
    public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public List<Integer>[] getCells() {
		return cells;
	}

	public void setCells(List<Integer>[] cells) {
		this.cells = cells;
	}

    @Override
    public String toString() {
    	return "width=" + width + " height=" + height + " blockSize=" + blockSize + " cells=" + Arrays.asList(cells);
    }
}
