package vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class QnaVO {

	private int Q_IDX, U_IDX;
	private String Q_TITLE, Q_CONTENT, Q_REGDATE, Q_PHOTO;
}
