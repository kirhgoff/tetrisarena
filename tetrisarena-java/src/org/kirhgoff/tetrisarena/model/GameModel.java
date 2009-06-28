package org.kirhgoff.tetrisarena.model;

import org.json.JSONBean;

import com.twolattes.json.Entity;
import com.twolattes.json.Value;

@Entity
public class GameModel extends JSONBean {
	@Value
	public int score;
	
	@Value
	public Board board;

	@Value
	public Block block;
	
	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public Block getBlock() {
		return block;
	}

	public void setBlock(Block block) {
		this.block = block;
	}

	@Override
	public String toString() {
		return "score=" + score + ", block=" + block + ", board=" + board;
	}
}
