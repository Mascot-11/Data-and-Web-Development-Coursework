<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="DataWebDev.Simple_Web_Forms.Project" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Management</title>
    <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
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
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECTID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-hover" AllowPaging="True">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="PROJECTID" HeaderText="PROJECTID" ReadOnly="True" SortExpression="PROJECTID" />
                        <asp:BoundField DataField="PROJECTNAME" HeaderText="PROJECTNAME" SortExpression="PROJECTNAME" />
                        <asp:BoundField DataField="PROJECTSTARTDATE" HeaderText="PROJECTSTARTDATE" SortExpression="PROJECTSTARTDATE" />
                        <asp:BoundField DataField="PROJECTSTATUS" HeaderText="PROJECTSTATUS" SortExpression="PROJECTSTATUS" />
                        <asp:BoundField DataField="PROJECTENDDATE" HeaderText="PROJECTENDDATE" SortExpression="PROJECTENDDATE" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECT&quot; WHERE &quot;PROJECTID&quot; = :PROJECTID" InsertCommand="INSERT INTO &quot;PROJECT&quot; (&quot;PROJECTID&quot;, &quot;PROJECTNAME&quot;, &quot;PROJECTSTARTDATE&quot;, &quot;PROJECTSTATUS&quot;, &quot;PROJECTENDDATE&quot;) VALUES (:PROJECTID, :PROJECTNAME, :PROJECTSTARTDATE, :PROJECTSTATUS, :PROJECTENDDATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot;, &quot;PROJECTSTARTDATE&quot;, &quot;PROJECTSTATUS&quot;, &quot;PROJECTENDDATE&quot; FROM &quot;PROJECT&quot;" UpdateCommand="UPDATE &quot;PROJECT&quot; SET &quot;PROJECTNAME&quot; = :PROJECTNAME, &quot;PROJECTSTARTDATE&quot; = :PROJECTSTARTDATE, &quot;PROJECTSTATUS&quot; = :PROJECTSTATUS, &quot;PROJECTENDDATE&quot; = :PROJECTENDDATE WHERE &quot;PROJECTID&quot; = :PROJECTID">
                    <DeleteParameters>
                        <asp:Parameter Name="PROJECTID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="PROJECTID" Type="Decimal" />
                        <asp:Parameter Name="PROJECTNAME" Type="String" />
                        <asp:Parameter Name="PROJECTSTARTDATE" Type="DateTime" />
                        <asp:Parameter Name="PROJECTSTATUS" Type="String" />
                        <asp:Parameter Name="PROJECTENDDATE" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="PROJECTNAME" Type="String" />
                        <asp:Parameter Name="PROJECTSTARTDATE" Type="DateTime" />
                        <asp:Parameter Name="PROJECTSTATUS" Type="String" />
                        <asp:Parameter Name="PROJECTENDDATE" Type="DateTime" />
                        <asp:Parameter Name="PROJECTID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECTID" DataSourceID="SqlDataSource1">
                    <EditItemTemplate>
                        PROJECTID:
                        <asp:Label ID="PROJECTIDLabel1" runat="server" Text='<%# Eval("PROJECTID") %>' />
                        <br />
                        PROJECTNAME:
                        <asp:TextBox ID="PROJECTNAMETextBox" runat="server" Text='<%# Bind("PROJECTNAME") %>' CssClass="form-control" />
                        <br />
                        PROJECTSTARTDATE:
                        <asp:TextBox ID="PROJECTSTARTDATETextBox" runat="server" Text='<%# Bind("PROJECTSTARTDATE") %>' CssClass="form-control" />
                        <br />
                        PROJECTSTATUS:
                        <asp:TextBox ID="PROJECTSTATUSTextBox" runat="server" Text='<%# Bind("PROJECTSTATUS") %>' CssClass="form-control" />
                        <br />
                        PROJECTENDDATE:
                        <asp:TextBox ID="PROJECTENDDATETextBox" runat="server" Text='<%# Bind("PROJECTENDDATE") %>' CssClass="form-control" />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        PROJECTID:
                        <asp:TextBox ID="PROJECTIDTextBox" runat="server" Text='<%# Bind("PROJECTID") %>' CssClass="form-control" />
                        <br />
                        PROJECTNAME:
                        <asp:TextBox ID="PROJECTNAMETextBox" runat="server" Text='<%# Bind("PROJECTNAME") %>' CssClass="form-control" />
                        <br />
                        PROJECTSTARTDATE:
                        <asp:TextBox ID="PROJECTSTARTDATETextBox" runat="server" Text='<%# Bind("PROJECTSTARTDATE") %>' CssClass="form-control" />
                        <br />
                        PROJECTSTATUS:
                        <asp:TextBox ID="PROJECTSTATUSTextBox" runat="server" Text='<%# Bind("PROJECTSTATUS") %>' CssClass="form-control" />
                        <br />
                        PROJECTENDDATE:
                        <asp:TextBox ID="PROJECTENDDATETextBox" runat="server" Text='<%# Bind("PROJECTENDDATE") %>' CssClass="form-control" />
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
    <!-- jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>