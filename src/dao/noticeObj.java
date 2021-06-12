package dao;

public class noticeObj {
		private String atitle, content, ts;
		public noticeObj(String atitle, String content, String ts) {
		this.atitle = atitle;
		this.content = content;
		this.ts = ts;
		}
		
		public String getAtitle() { return this.atitle; }
		public String getContent() { return this.content; }
		public String getTs() { return this.ts; }
}
