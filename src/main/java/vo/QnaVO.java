package vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class QnaVO {

	private int q_idx, u_idx;
	private String q_title, q_content, q_regdate, q_photo;
}
