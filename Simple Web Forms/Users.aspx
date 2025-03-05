<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="DataWebDev.Simple_Web_Forms.Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Management</title>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USERID&quot; = :USERID" InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USERID&quot;, &quot;USERNAME&quot;, &quot;EMAIL&quot;, &quot;USERROLE&quot;, &quot;USERCONTACT&quot;) VALUES (:USERID, :USERNAME, :EMAIL, :USERROLE, :USERCONTACT)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot;, &quot;EMAIL&quot;, &quot;USERROLE&quot;, &quot;USERCONTACT&quot; FROM &quot;USERS&quot;" UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;USERNAME&quot; = :USERNAME, &quot;EMAIL&quot; = :EMAIL, &quot;USERROLE&quot; = :USERROLE, &quot;USERCONTACT&quot; = :USERCONTACT WHERE &quot;USERID&quot; = :USERID">
                    <DeleteParameters>
                        <asp:Parameter Name="USERID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="USERID" Type="Decimal" />
                        <asp:Parameter Name="USERNAME" Type="String" />
                        <asp:Parameter Name="EMAIL" Type="String" />
                        <asp:Parameter Name="USERROLE" Type="String" />
                        <asp:Parameter Name="USERCONTACT" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="USERNAME" Type="String" />
                        <asp:Parameter Name="EMAIL" Type="String" />
                        <asp:Parameter Name="USERROLE" Type="String" />
                        <asp:Parameter Name="USERCONTACT" Type="Decimal" />
                        <asp:Parameter Name="USERID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USERID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-hover">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="USERID" HeaderText="USER ID" ReadOnly="True" SortExpression="USERID" />
                        <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                        <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                        <asp:BoundField DataField="USERROLE" HeaderText="USER ROLE" SortExpression="USERROLE" />
                        <asp:BoundField DataField="USERCONTACT" HeaderText="USER CONTACT" SortExpression="USERCONTACT" />
                    </Columns>
                </asp:GridView>

                <asp:FormView ID="FormView1" runat="server" DataKeyNames="USERID" DataSourceID="SqlDataSource1">
                    <EditItemTemplate>
                        USER ID:
                        <asp:Label ID="USERIDLabel" runat="server" Text='<%# Eval("USERID") %>' />
                        <br />
                        USERNAME:
                        <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' CssClass="form-control" />
                        <br />
                        EMAIL:
                        <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' CssClass="form-control" />
                        <br />
                        USER ROLE:
                        <asp:TextBox ID="USERROLETextBox" runat="server" Text='<%# Bind("USERROLE") %>' CssClass="form-control" />
                        <br />
                        USER CONTACT:
                        <asp:TextBox ID="USERCONTACTTextBox" runat="server" Text='<%# Bind("USERCONTACT") %>' CssClass="form-control" />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        USER ID:
                        <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' CssClass="form-control" />
                        <br />
                        USERNAME:
                        <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' CssClass="form-control" />
                        <br />
                        EMAIL:
                        <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' CssClass="form-control" />
                        <br />
                        USER ROLE:
                        <asp:TextBox ID="USERROLETextBox" runat="server" Text='<%# Bind("USERROLE") %>' CssClass="form-control" />
                        <br />
                        USER CONTACT:
                        <asp:TextBox ID="USERCONTACTTextBox" runat="server" Text='<%# Bind("USERCONTACT") %>' CssClass="form-control" />
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