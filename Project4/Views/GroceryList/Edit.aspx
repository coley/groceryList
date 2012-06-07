<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of Project4.GroceryList)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- scripts for client-side validation -->
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcValidation.js" type="text/javascript"></script>

    <!-- enables client side validation -->
    <% Html.EnableClientValidation()%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>Edit</h2>

    <%-- The following line works around an ASP.NET compiler warning --%>
    <%: ""%>

    <% Using Html.BeginForm() %>
        <%: Html.ValidationSummary(True) %>
        <fieldset>
            <legend>Fields</legend>
            
            <div>
                <span class="editor-label">
                    ID
                </span>
                <span class="editor-field">
                    <span><%: Model.id%></span>
                </span>
            </div>
            
            <div>
                <span class="editor-label">
                   Description
                </span>
                <span class="editor-field">
                    <%: Html.TextBoxFor(Function(model) model.description) %>
                    <%: Html.ValidationMessageFor(Function(model) model.description) %>
                </span>
            </div>
            
            <div>
                <span class="editor-label">
                    Quantity
                </span>
                <span class="editor-field">
                    <%: Html.TextBoxFor(Function(model) model.qty) %>
                    <%: Html.ValidationMessageFor(Function(model) model.qty) %>
                </span>
             </div>
            
            <div>
                <span class="editor-label">
                    Created
                </span>
                <span class="editor-field">
                    <span><%: Model.created%></span>
                </span>
            </div>
            
            <br />

            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% End Using %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

