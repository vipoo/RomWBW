#DEFINE ISHBIOS		LD	A, (HBIOSMD) \ OR A
#DEFINE PRTSTRDE(X)	LD	DE, X \ CALL PRTSTR
#DEFINE PRTCRLF		CALL	CRLF
#DEFINE ERRWITHMSG(X)	LD	DE, X \ JP ERR
