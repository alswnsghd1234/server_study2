/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.78
 * Generated at: 2022-05-12 12:32:23 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.kh.member.model.vo.Member;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/views/common/menubar.jsp", Long.valueOf(1652353835106L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("com.kh.member.model.vo.Member");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("		<!--      C(reate) R(ead) U(pdate) D(elete)  \r\n");
      out.write("		회원 서비스  | insert /select / update / delete \r\n");
      out.write("		로그인        |        /   O   /        /        \r\n");
      out.write("		회원가입      |   O    /       /        /           \r\n");
      out.write("		내정보보기   |        /   O   /        /         \r\n");
      out.write("		정보변경     |        /       /    O    /        \r\n");
      out.write("		회원탈퇴     |        /       /         /    O \r\n");
      out.write("		\r\n");
      out.write("		공지사항게시판 - 공지사항 리스트 조회(R)/공지사항 상세보기(R)/ 공지사항 작성(C) / 공지사항 수정(U) / 공지사항 삭제 (D)\r\n");
      out.write("		일반게시판\r\n");
      out.write("		사진게시판 \r\n");
      out.write("		-->\r\n");
      out.write("		\r\n");
      out.write("		<br><br>\r\n");
      out.write("		\r\n");
      out.write("		");
      out.write('\r');
      out.write('\n');

	Member loginUser = (Member)session.getAttribute("loginUser");
	String contextPath = request.getContextPath();
	//loginUser가 null이면 로그인전
	//loginUser가 null이 아니면 로그인 후 화면을 보여주면 된다.
	
	String alertMsg =(String)session.getAttribute("alertMsg");
	

      out.write("\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<!-- Latest compiled and minified CSS -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css\">\r\n");
      out.write("\r\n");
      out.write("<!-- jQuery library -->\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<!-- Popper JS -->\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<!-- Latest compiled JavaScript -->\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("    .nav-area{background-color: blanchedalmond;}\r\n");
      out.write("    .menu{\r\n");
      out.write("        display: inline-block;\r\n");
      out.write("        height: 50px;\r\n");
      out.write("        width: 150px;\r\n");
      out.write("    }\r\n");
      out.write("    .menu a{\r\n");
      out.write("        text-decoration: none;\r\n");
      out.write("        color: brown;\r\n");
      out.write("        font-size: 20px;\r\n");
      out.write("        font-weight: bold;\r\n");
      out.write("        display: block;\r\n");
      out.write("        width: 100%;\r\n");
      out.write("        height: 100%;\r\n");
      out.write("        line-height: 50px;\r\n");
      out.write("    }\r\n");
      out.write("    .menu a:hover{\r\n");
      out.write("        background-color: darksalmon;\r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("    #login-form,#user-info{\r\n");
      out.write("        float: right;\r\n");
      out.write("    }\r\n");
      out.write("    .login-area{\r\n");
      out.write("        margin-right: 10px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<script>		\r\n");
      out.write("		var msg = \"");
      out.print(alertMsg);
      out.write("\"; // \"회원가입에 성공했습니다.\" /\"null\"\r\n");
      out.write("		\r\n");
      out.write("		if(msg!=\"null\"){\r\n");
      out.write("			alert(msg);\r\n");
      out.write("			//알림창을 띄워준 후에 session에 담긴 msg를 지워주지 않으면 \r\n");
      out.write("			//해당 페이지가 읽혀질때마다 alert 메세지가 뜨게된다 \r\n");
      out.write("			//지워줘야함\r\n");
      out.write("			");
session.removeAttribute("alertMsg");
      out.write("\r\n");
      out.write("		}\r\n");
      out.write("		\r\n");
      out.write("	</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <h1 align=\"center\">본격 게시판</h1>\r\n");
      out.write("    \r\n");
      out.write("    <div class=\"login-area\">\r\n");
      out.write("    ");
if(loginUser==null) {
      out.write("\r\n");
      out.write("        <!--로그인 전에 보여지는 로그인 form-->\r\n");
      out.write("        <form action=\"");
      out.print(contextPath);
      out.write("/login.me\" method=\"post\" id=\"login-form\">\r\n");
      out.write("            <table>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <th>아이디</th>\r\n");
      out.write("                    <td><input type=\"text\" name=\"userId\" required></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <th>비밀번호</th>\r\n");
      out.write("                    <td><input type=\"password\" name=\"userPwd\" required></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <th colspan=\"2\">\r\n");
      out.write("                        <button type=\"submit\">로그인</button>\r\n");
      out.write("                        <button type=\"button\" onclick=\"enrollPage();\">회원가입</button>\r\n");
      out.write("                    </th>\r\n");
      out.write("                </tr>\r\n");
      out.write("\r\n");
      out.write("            </table>\r\n");
      out.write("        </form>\r\n");
      out.write("\r\n");
      out.write("        <script>\r\n");
      out.write("            function enrollPage(){\r\n");
      out.write("               //location.href=\"");
      out.print(contextPath);
      out.write("/views/member/MemberEnrollForm.jsp\";\r\n");
      out.write("            	//url에 디렉토리 구조가 노출되면 보안상 위험하다.\r\n");
      out.write("            	//단순한 정적페이지 이동도 servlet을 거쳐서 url에 매핑값만 보일수 있도록 작업하기\r\n");
      out.write("            	location.href=\"/JSP/enrollForm.me\";\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("        </script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        ");
}else{ 
      out.write("\r\n");
      out.write("        <!-- 로그인 성공 후 보여질 영역 -->\r\n");
      out.write("        	<div id=\"user-info\">\r\n");
      out.write("        		<b>");
      out.print(loginUser.getUserName());
      out.write("</b>님 환영합니다  <br><br>\r\n");
      out.write("        		<a href=\"");
      out.print(contextPath);
      out.write("/myPage.me\">마이페이지</a>\r\n");
      out.write("        		<a href=\"");
      out.print(contextPath);
      out.write("/logout.me\">로그아웃</a>\r\n");
      out.write("        		\r\n");
      out.write("        	</div>	\r\n");
      out.write("        		\r\n");
      out.write("        ");
}
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <br>\r\n");
      out.write("    <br clear=\"both\"> <!--float 해제-->\r\n");
      out.write("    \r\n");
      out.write("    <div class=\"nav-area\" align=\"center\">\r\n");
      out.write("\r\n");
      out.write("        <div class=\"menu\"><a href=\"");
      out.print(contextPath);
      out.write("\">HOME</a></div>\r\n");
      out.write("        <div class=\"menu\"><a href=\"");
      out.print(contextPath);
      out.write("/list.no\">공지사항</a></div>\r\n");
      out.write("        <div class=\"menu\"><a href=\"");
      out.print(contextPath);
      out.write("/list.bo?cpage=1\">일반게시판</a></div>\r\n");
      out.write("        <div class=\"menu\"><a href=\"\">사진게시판</a></div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("		\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
