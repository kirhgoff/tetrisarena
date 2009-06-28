package org.kirhgoff.tetrisarena;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.junit.Assert;
import org.junit.Test;
import org.kirhgoff.tetrisarena.model.GameModel;

import com.twolattes.json.Json;
import com.twolattes.json.Marshaller;
import com.twolattes.json.TwoLattes;

@SuppressWarnings("serial")
public class TetrisarenaServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("jhlkjhklhkjh");
		String data = (String) req.getParameter("data");
		String command = (String) req.getParameter("command");
		System.out.println("Received request: " + System.currentTimeMillis());

		GameModel model = new GameModel();
		model = fromJSONToJava(data, model);

		System.out.println("Model=" + model + " command=" + command);
	}

	private static GameModel fromJSONToJava(String data, GameModel model) {
			// model.fromJSONObj(new JSONObject(data));
			Marshaller<GameModel> marshaller = TwoLattes.createMarshaller(GameModel.class);
			return marshaller.unmarshall( (Json.Object) Json.fromString(data));
	}

	public static final String SAMPLE = "{\"score\":0,\"block\":null,\"board\":{\"width\":16,\"blockSize\":10,\"cells\":[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]],\"height\":24}}\"";

	@Test
	public void testJSON() {
		GameModel gameModel = new GameModel();
		gameModel = fromJSONToJava(SAMPLE, gameModel);
		Assert.assertNotNull(gameModel.block);
		Assert.assertNotNull(gameModel.board);
	}

}
