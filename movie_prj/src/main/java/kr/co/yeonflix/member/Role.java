package kr.co.yeonflix.member;

public enum Role {

	ROLE_GUEST(true, false),
	ROLE_MEMBER(true, true),
	ROLE_MANAGER(true, true),
	ROLE_ADMIN(true, true);
	
	private boolean readable; //읽기 권한
	private boolean writable; //쓰기 권한 
	
	
	private Role(boolean readable, boolean writeable) {
		this.readable = readable;
		this.writable = writeable;
	}
	
	public boolean isReadable() {
		return readable;
	}
	
	public boolean isWritable() {
		return writable;
	}
	
}
