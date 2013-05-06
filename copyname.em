/*
    This macro is written for source code editor "Source Insight"

    Howto:
        Add this file to the "Base Project" to take effect in all projects globally


    Created based on
    1.
       http://doblex.tistory.com/entry/source-insight-macro-%EC%A0%95%EB%A6%AC
    2.
       http://sajay.com/?p=59674340

    Author: vicjang@ucdavis.edu
*/

macro CopyFileFullPath()
{
    /* Get current file name from buf */
    hbuf = GetCurrentBuf()
    if(hbuf == 0)
    {
          msg("No buffer available");
          stop
    }
    FullFileName = GetBufName( hbuf )

    /* Add file name to clipboard */
    hbufClip = GetBufHandle("Clipboard")
    ClearBuf( hbufClip )
    AppendBufLine( hbufClip, FullFileName )
}

macro CopyFileName()
{
    /* Get current file name from buf */
    hbuf = GetCurrentBuf()
    if(hbuf == 0)
    {
          /* Print error message when no file is opened */
          msg("No buffer available");
          stop
    }

    FullFileName = GetBufName( hbuf )

    /* Find the last occurrence of \ */
    pos = strlen( FullFileName ) - 1
    while( FullFileName[pos] != "\\" )
    {
        pos = pos -1
    }

    /* Separate the path and name */
    pathOnly = strmid( FullFileName, 0, pos )
    nameOnly = strmid( FullFileName, pos + 1, strlen( FullFileName ) )

    /* Add file name to clipboard */
    hbufClip = GetBufHandle("Clipboard")
    ClearBuf( hbufClip )
    AppendBufLine( hbufClip, nameOnly )

}


