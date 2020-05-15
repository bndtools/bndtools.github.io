---
title: JAR Viewer
description: Shows the content of a JAR file with extra attention for OSGi information
---

Double clicking a JAR or ZIP file wil open the Bndtools JAR Editor. It will display the JAR file's content with the following tabs:

- [Content](#content) – The content of the selected JAR
- [Print](#print) – Summary of OSGi information

If the JAR file changes on the file system, it will be automatically updated.

## Content

In the content tab you can double click entries, this will open a new editor on that file. You can also drag files from the list on the file system or the Eclipse lists that accepts files.

<img src="/images/jar-editor-content.png" style="width:772px" class="view">

You can view the files as text or as binary. The JAR Editor guess what the preferred view is. In the text display, a special character set can be selected.

<img src="/images/jar-editor-hex.png" style="width:772px" class="view">

## Print

<img src="/images/jar-editor-print.png" style="width:772px" class="view">

## Find

In the print page, if you use `cmd/ctrl+f`, this will open a "find..." text box in the header. Once the "find" text box is open, you can close it with the "close" button on right hand side.

![image](https://user-images.githubusercontent.com/595221/80650064-cb30dc00-8a38-11ea-98f2-356568bdc19d.png)

Once you type in some search text, it will highlight all of the matches in the whole page, and for the first occurrence it will set the selection on it as well as modify the highlight to signal its the "current" highlight.

![image](https://user-images.githubusercontent.com/595221/80650424-9a04db80-8a39-11ea-95b1-beca5ed5937a.png)

You can advance to next and previous match using arrows and the match/totalCount is displayed. Also you can use the global "next" and "previous" shortcuts as well. 1cmd/ctrl+.1, 1shiftt+cmd/ctrl+.` respectively.

![image](https://user-images.githubusercontent.com/595221/80650466-a852f780-8a39-11ea-815d-a50c01e0ddb0.png)

If the next occurrence is out of the current viewport of the text area, it will scroll the text view to show the new highlight.
