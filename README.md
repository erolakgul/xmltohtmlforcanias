# xmltohtmlforcanias
berat ve kebirlerin görüntülerinin açılması


FINT11D001 dialoğu crosslanır

DETAIL buton içeriği

<code>
/* BURADA FINT11 İÇİN OLUŞTURALN GRUPTA OLAN KİŞİLERDE ÇALIŞMASI İÇİN KISIT EKLİYORUZ  
   RUNFILE @CLSTRFILEPATH; YERİNE OLACAK OLAN KOD BLOKLARI */
IF HAKFINT11XMLTBL_ROWCOUNT > 0 THEN
    OBJECT: 
        STRING XMLPATH,
        STRING HTMLPATH,
        STRING XSLTPATH,
        STRING CMD,
        STRING STRING1,
        STRING STRINGVAR1,
        STRING HAKBOOKTYPE;
    XMLPATH  = REPLACE(@CLSTRFILEPATH, '*', '');
    HTMLPATH = REPLACE(XMLPATH, '.xml', '.html');
    /* PARS SAY */
    LOCAL: 
        INTEGER HAKCOUNTER;
    HAKCOUNTER = 0;
    PARSE FNAME INTO STRINGVAR1 DELIMITER '-' 
    BEGIN
        HAKCOUNTER = HAKCOUNTER + 1;
        IF STRSTR(FNAME,0,3) == 'GIB' THEN
            IF HAKCOUNTER == 4 THEN
                HAKBOOKTYPE = STRINGVAR1;
            ENDIF;
        ELSE
            IF HAKCOUNTER == 3 THEN
                HAKBOOKTYPE = STRINGVAR1;
            ENDIF;
        ENDIF;
    ENDPARSE;
    IF HAKBOOKTYPE == 'Y' THEN
        XSLTPATH = 'C:\e-XXXXXX\YYYYYY\yevmiye.xslt';
    ENDIF;
    IF HAKBOOKTYPE == 'YB' THEN
        XSLTPATH = 'C:\e-XXXXXX\YYYYYY\berat.xslt';
    ENDIF;
    IF HAKBOOKTYPE == 'K' THEN
        XSLTPATH = 'C:\e-XXXXXX\YYYYYY\kebir.xslt';
    ENDIF;
    IF HAKBOOKTYPE == 'KB' THEN
        XSLTPATH = 'C:\e-XXXXXX\YYYYYY\berat.xslt';
    ENDIF;
    /* XML'i HTML'e dönüştür */
    CMD = '*cmd.exe /c C:\e-XXXXXX\YYYYYY\tools\transform.bat "' 
          + XMLPATH + '" "' + XSLTPATH + '" "' + HTMLPATH + '"';
    RUNPROGRAM @CMD WITH WAIT INTO STRING1;
    MESSAGE BAS E2000 WITH STRING1;
    /* html'i aç */
    HTMLPATH = REPLACE(@HTMLPATH, '\', '/');
    CMD = '*cmd.exe /c start ' + HTMLPATH;
    RUNPROGRAM @CMD;
ELSE
    RUNFILE @CLSTRFILEPATH;
ENDIF;

</code>
