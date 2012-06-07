<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of Project4.GroceryList)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div>
            <span class="display-label">ID</span>
            <span class="display-field"><%: Model.id %></span>
        </div>
        
        <div>
            <span class="display-label">Description</span>
            <span class="display-field"><%: Model.description %></span>
        </div>
        
        <div>
            <span class="display-label">Quantity</span>
            <span class="display-field"><%: Model.qty %></span>
        </div>
        
        <div>
            <span class="display-label">Created</span>
            <span class="display-field"><%: String.Format("{0:g}", Model.created) %></span>
        </div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit", New With {.id = Model.id})%> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

