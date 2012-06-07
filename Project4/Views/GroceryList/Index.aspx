<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of Project4.GroceryList))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	List
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../../Scripts/GroceryList/index.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>List</h2>

    <p>
        <%: Html.ActionLink("Create New", "Create")%>
    </p>
    
    <%  Dim itemCount = Model.Count
        If (itemCount > 0) Then%>
        <table id="<%: itemCount %>">
            <tr>
                <th>
                    Action
                </th>
                <th>
                    Description
                </th>
                <th>
                    Quantity
                </th>
                <th>
                    Created
                </th>
                <th>
                    ID
                </th>
            </tr>

        <% For Each item In Model%>
    
            <tr id="<%: item.id %>">
                <td>
                    <%: Html.ActionLink("Edit", "Edit", New With {.id = item.id})%> |
                    <%: Html.ActionLink("Details", "Details", New With {.id = item.id})%> |
                    <a class="delete" href="javascript://">Delete</a>
                    <%-- <%: Html.ActionLink("Delete", "Delete", New With {.id = item.id})%> --%>
                </td>
                <td align="left">
                    <%: item.description %>
                </td>
                <td align="right">
                    <%: item.qty %>
                </td>
                <td align="right">
                    <%: String.Format("{0:g}", item.created) %>
                </td>
                 <td align="right">
                    <%: item.id %>
                </td>
            </tr>
    
        <% Next%>

        </table>

    <% End If%>

</asp:Content>

