<%@ page import="com.darryl.model.Customer" %>
<%@ page import="java.util.List" %>

<%
  List<Customer> customers = (List<Customer>) pageContext.findAttribute("customers");
for(Customer c : customers){
	out.println(c.getFirstName() + " :: " + c.getEmail() + "<br/>");
}
%>
