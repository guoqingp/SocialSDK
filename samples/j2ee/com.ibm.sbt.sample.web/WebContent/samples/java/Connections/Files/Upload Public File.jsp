<!-- /*
 * � Copyright IBM Corp. 2012
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); 
 * you may not use this file except in compliance with the License. 
 * You may obtain a copy of the License at:
 * 
 * http://www.apache.org/licenses/LICENSE-2.0 
 * 
 * Unless required by applicable law or agreed to in writing, software 
 * distributed under the License is distributed on an "AS IS" BASIS, 
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or 
 * implied. See the License for the specific language governing 
 * permissions and limitations under the License.
 */-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.ibm.sbt.services.client.connections.files.model.FileCreationParameters"%>
<%@page import="com.ibm.sbt.services.client.connections.files.FileService"%>
<%@page import="com.ibm.sbt.services.client.connections.files.model.CommentEntry"%>
<%@page import="com.ibm.sbt.services.client.connections.files.model.FileEntry"%>
<%@page import="com.ibm.sbt.services.client.connections.files.FileEntryList"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.ibm.commons.runtime.Application"%>
<%@page import="com.ibm.commons.runtime.Context"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>SBT JAVA Sample - Add Community Member</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<body>
  <h4>Upload File</h4>
  <div id="content">
    <%
        try {
            FileService communityService = new FileService();
            String content = "Test Content";
            String name = "Test File " + System.nanoTime() + ".txt";
            FileCreationParameters p = new FileCreationParameters();
            p.visibility = FileCreationParameters.Visibility.PUBLIC;

            FileEntry entry = communityService.upload(
                    new ByteArrayInputStream(content.getBytes(Charset.forName("UTF-8"))), name,
                    content.length(), p.buildParameters());

            out.println("File created: id [" + entry.getFileId() + "] title [" + entry.getTitle() + "]");
        } catch (Throwable e) {
            out.println("<pre>");
            out.println(e.getMessage());
            out.println("</pre>");
        }
    %>
  </div>
</body>
</html>