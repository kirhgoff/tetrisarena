package org.kirhgoff.tetrisarena.model;

import java.util.Arrays;
import java.util.List;

import org.json.JSONBean;

import com.twolattes.json.Entity;
import com.twolattes.json.Value;

@Entity
public class Block extends JSONBean {
    
	@Value
	public int xPos;
    
	@Value
	public int yPos;
	
	@Value
	public int rotation;
	
	@Value
	public int rotations;

	@Value
	public List<Integer>[] cells;

	public int getXPos() {
		return xPos;
	}

	public void setXPos(int pos) {
		xPos = pos;
	}

	public int getYPos() {
		return yPos;
	}

	public void setYPos(int pos) {
		yPos = pos;
	}

	public int getRotation() {
		return rotation;
	}

	public void setRotation(int rotation) {
		this.rotation = rotation;
	}

	public int getRotations() {
		return rotations;
	}

	public void setRotations(int rotations) {
		this.rotations = rotations;
	}

	public List<Integer>[] getCells() {
		return cells;
	}

	public void setCells(List<Integer>[] cells) {
		this.cells = cells;
	}

    @Override
    public String toString() {
    	return "x=" + xPos + " y=" + yPos + "cells=" + Arrays.asList(cells);
    }
}
