<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User Project.aspx.cs" Inherits="DataWebDev.Complex_Web_Forms.Project_Milestone" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Project Management</title>
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
            </div>
        </div>
    </nav>

    <div class="container">
        <form id="form1" runat="server">
            <div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot; FROM &quot;USERS&quot;">
                </asp:SqlDataSource>

                <div class="mb-3">
                    <label class="form-label">Select User</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        AutoPostBack="True" 
                        DataSourceID="SqlDataSource2" 
                        DataTextField="USERNAME" 
                        DataValueField="USERID" 
                        CssClass="form-select">
                    </asp:DropDownList>
                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT 
                        U.UserID, U.UserName, U.Email, U.UserRole, U.UserContact,
                        P.ProjectID, P.ProjectName, P.ProjectStartDate, P.ProjectEndDate, P.ProjectStatus
                    FROM Users U
                    JOIN UserProject UP ON U.UserID = UP.Users_UserID
                    JOIN Project P ON UP.Projects_ProjectID = P.ProjectID 
                    WHERE U.UserID = :UserID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="UserID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:GridView ID="GridView1" runat="server" 
                    AutoGenerateColumns="False" 
                    DataKeyNames="USERID,PROJECTID" 
                    DataSourceID="SqlDataSource1" 
                    CssClass="table table-striped table-hover">
                    <Columns>
                        <asp:BoundField DataField="USERID" HeaderText="USER ID" SortExpression="USERID" />
                        <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                        <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                        <asp:BoundField DataField="USERROLE" HeaderText="USER ROLE" SortExpression="USERROLE" />
                        <asp:BoundField DataField="USERCONTACT" HeaderText="USER CONTACT" SortExpression="USERCONTACT" />
                        <asp:BoundField DataField="PROJECTID" HeaderText="PROJECT ID" SortExpression="PROJECTID" />
                        <asp:BoundField DataField="PROJECTNAME" HeaderText="PROJECT NAME" SortExpression="PROJECTNAME" />
                        <asp:BoundField DataField="PROJECTSTARTDATE" HeaderText="START DATE" SortExpression="PROJECTSTARTDATE" />
                        <asp:BoundField DataField="PROJECTENDDATE" HeaderText="END DATE" SortExpression="PROJECTENDDATE" />
                        <asp:BoundField DataField="PROJECTSTATUS" HeaderText="PROJECT STATUS" SortExpression="PROJECTSTATUS" />
                    </Columns>
                </asp:GridView>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>