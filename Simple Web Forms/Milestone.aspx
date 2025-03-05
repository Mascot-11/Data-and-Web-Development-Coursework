<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Milestone.aspx.cs" Inherits="DataWebDev.Simple_Web_Forms.Milestone1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Milestone Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <!-- Bootstrap Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="../Home Page.aspx">Project Management</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                               <ul class="navbar-nav">
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Forms
                        </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="Milestone.aspx">Milestone Form</a></li>
            <li><a class="dropdown-item" href="Project.aspx">Project Form</a></li>
            <li><a class="dropdown-item" href="SubTask.aspx">SubTask Form</a></li>
            <li><a class="dropdown-item" href="Task.aspx">Task Form</a></li>
            <li><a class="dropdown-item" href="Users.aspx">Users Form</a></li>
            
    </li>
</ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <form id="form1" runat="server">
            <div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MILESTONE&quot; WHERE &quot;MILESTONEID&quot; = :MILESTONEID" InsertCommand="INSERT INTO &quot;MILESTONE&quot; (&quot;MILESTONEID&quot;, &quot;MILESTONENAME&quot;, &quot;PROJECTS_PROJECTID&quot;, &quot;MILESTONEDUEDATE&quot;) VALUES (:MILESTONEID, :MILESTONENAME, :PROJECTS_PROJECTID, :MILESTONEDUEDATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONEID&quot;, &quot;MILESTONENAME&quot;, &quot;PROJECTS_PROJECTID&quot;, &quot;MILESTONEDUEDATE&quot; FROM &quot;MILESTONE&quot;" UpdateCommand="UPDATE &quot;MILESTONE&quot; SET &quot;MILESTONENAME&quot; = :MILESTONENAME, &quot;PROJECTS_PROJECTID&quot; = :PROJECTS_PROJECTID, &quot;MILESTONEDUEDATE&quot; = :MILESTONEDUEDATE WHERE &quot;MILESTONEID&quot; = :MILESTONEID">
                    <DeleteParameters>
                        <asp:Parameter Name="MILESTONEID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="MILESTONEID" Type="Decimal" />
                        <asp:Parameter Name="MILESTONENAME" Type="String" />
                        <asp:Parameter Name="PROJECTS_PROJECTID" Type="Decimal" />
                        <asp:Parameter Name="MILESTONEDUEDATE" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="MILESTONENAME" Type="String" />
                        <asp:Parameter Name="PROJECTS_PROJECTID" Type="Decimal" />
                        <asp:Parameter Name="MILESTONEDUEDATE" Type="DateTime" />
                        <asp:Parameter Name="MILESTONEID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECT&quot; WHERE &quot;PROJECTID&quot; = :PROJECTID" InsertCommand="INSERT INTO &quot;PROJECT&quot; (&quot;PROJECTNAME&quot;, &quot;PROJECTID&quot;) VALUES (:PROJECTNAME, :PROJECTID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECTNAME&quot;, &quot;PROJECTID&quot; FROM &quot;PROJECT&quot;" UpdateCommand="UPDATE &quot;PROJECT&quot; SET &quot;PROJECTNAME&quot; = :PROJECTNAME WHERE &quot;PROJECTID&quot; = :PROJECTID">
                    <DeleteParameters>
                        <asp:Parameter Name="PROJECTID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="PROJECTNAME" Type="String" />
                        <asp:Parameter Name="PROJECTID" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="PROJECTNAME" Type="String" />
                        <asp:Parameter Name="PROJECTID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MILESTONEID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-hover" AllowPaging="True">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="MILESTONEID" HeaderText="MILESTONEID" ReadOnly="True" SortExpression="MILESTONEID" />
                        <asp:BoundField DataField="MILESTONENAME" HeaderText="MILESTONENAME" SortExpression="MILESTONENAME" />
                        <asp:BoundField DataField="PROJECTS_PROJECTID" HeaderText="PROJECTS_PROJECTID" SortExpression="PROJECTS_PROJECTID" />
                        <asp:BoundField DataField="MILESTONEDUEDATE" HeaderText="MILESTONEDUEDATE" SortExpression="MILESTONEDUEDATE" />
                        <asp:TemplateField HeaderText="Project Name">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PROJECTNAME" DataValueField="PROJECTID" SelectedValue='<%# Bind("PROJECTS_PROJECTID") %>' CssClass="form-select">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONEID" DataSourceID="SqlDataSource1">
                    <EditItemTemplate>
                        MILESTONEID:
                        <asp:Label ID="MILESTONEIDLabel1" runat="server" Text='<%# Eval("MILESTONEID") %>' />
                        <br />
                        MILESTONENAME:
                        <asp:TextBox ID="MILESTONENAMETextBox" runat="server" Text='<%# Bind("MILESTONENAME") %>' CssClass="form-control" />
                        <br />
                        PROJECTS_PROJECTID:
                        <asp:TextBox ID="PROJECTS_PROJECTIDTextBox" runat="server" Text='<%# Bind("PROJECTS_PROJECTID") %>' CssClass="form-control" />
                        <br />
                        MILESTONEDUEDATE:
                        <asp:TextBox ID="MILESTONEDUEDATETextBox" runat="server" Text='<%# Bind("MILESTONEDUEDATE") %>' CssClass="form-control" />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        MILESTONEID:
                        <asp:TextBox ID="MILESTONEIDTextBox" runat="server" Text='<%# Bind("MILESTONEID") %>' CssClass="form-control" />
                        <br />
                        MILESTONENAME:
                        <asp:TextBox ID="MILESTONENAMETextBox" runat="server" Text='<%# Bind("MILESTONENAME") %>' CssClass="form-control" />
                        <br />
                        PROJECTS_PROJECTID:
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PROJECTNAME" DataValueField="PROJECTID" SelectedValue='<%# Bind("PROJECTS_PROJECTID") %>' CssClass="form-select">
                        </asp:DropDownList>
                        <br />
                        MILESTONEDUEDATE:
                        <asp:TextBox ID="MILESTONEDUEDATETextBox" runat="server" Text='<%# Bind("MILESTONEDUEDATE") %>' CssClass="form-control" />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-success" />
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>