<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Task.aspx.cs" Inherits="DataWebDev.Simple_Web_Forms.Task" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task Management</title>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TASKS&quot; WHERE &quot;TASKID&quot; = :TASKID" InsertCommand="INSERT INTO &quot;TASKS&quot; (&quot;TASKID&quot;, &quot;TASKNAME&quot;, &quot;TASKSTARTDATE&quot;, &quot;TASKSTATUS&quot;, &quot;TASKDUEDATE&quot;) VALUES (:TASKID, :TASKNAME, :TASKSTARTDATE, :TASKSTATUS, :TASKDUEDATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKNAME&quot;, &quot;TASKSTARTDATE&quot;, &quot;TASKSTATUS&quot;, &quot;TASKDUEDATE&quot; FROM &quot;TASKS&quot;" UpdateCommand="UPDATE &quot;TASKS&quot; SET &quot;TASKNAME&quot; = :TASKNAME, &quot;TASKSTARTDATE&quot; = :TASKSTARTDATE, &quot;TASKSTATUS&quot; = :TASKSTATUS, &quot;TASKDUEDATE&quot; = :TASKDUEDATE WHERE &quot;TASKID&quot; = :TASKID">
                    <DeleteParameters>
                        <asp:Parameter Name="TASKID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="TASKID" Type="Decimal" />
                        <asp:Parameter Name="TASKNAME" Type="String" />
                        <asp:Parameter Name="TASKSTARTDATE" Type="DateTime" />
                        <asp:Parameter Name="TASKSTATUS" Type="String" />
                        <asp:Parameter Name="TASKDUEDATE" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="TASKNAME" Type="String" />
                        <asp:Parameter Name="TASKSTARTDATE" Type="DateTime" />
                        <asp:Parameter Name="TASKSTATUS" Type="String" />
                        <asp:Parameter Name="TASKDUEDATE" Type="DateTime" />
                        <asp:Parameter Name="TASKID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TASKID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-hover" AllowPaging="True">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="TASKID" HeaderText="TASK ID" ReadOnly="True" SortExpression="TASKID" />
                        <asp:BoundField DataField="TASKNAME" HeaderText="TASK NAME" SortExpression="TASKNAME" />
                        <asp:BoundField DataField="TASKSTARTDATE" HeaderText="START DATE" SortExpression="TASKSTARTDATE" />
                        <asp:BoundField DataField="TASKSTATUS" HeaderText="STATUS" SortExpression="TASKSTATUS" />
                        <asp:BoundField DataField="TASKDUEDATE" HeaderText="DUE DATE" SortExpression="TASKDUEDATE" />
                    </Columns>
                </asp:GridView>

                <asp:FormView ID="FormView1" runat="server" DataKeyNames="TASKID" DataSourceID="SqlDataSource1">
                    <EditItemTemplate>
                        TASK ID:
                        <asp:Label ID="TASKIDLabel" runat="server" Text='<%# Eval("TASKID") %>' />
                        <br />
                        TASK NAME:
                        <asp:TextBox ID="TASKNAMETextBox" runat="server" Text='<%# Bind("TASKNAME") %>' CssClass="form-control" />
                        <br />
                        START DATE:
                        <asp:TextBox ID="TASKSTARTDATETextBox" runat="server" Text='<%# Bind("TASKSTARTDATE") %>' CssClass="form-control" />
                        <br />
                        STATUS:
                        <asp:TextBox ID="TASKSTATUSTextBox" runat="server" Text='<%# Bind("TASKSTATUS") %>' CssClass="form-control" />
                        <br />
                        DUE DATE:
                        <asp:TextBox ID="TASKDUEDATETextBox" runat="server" Text='<%# Bind("TASKDUEDATE") %>' CssClass="form-control" />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        TASK ID:
                        <asp:TextBox ID="TASKIDTextBox" runat="server" Text='<%# Bind("TASKID") %>' CssClass="form-control" />
                        <br />
                        TASK NAME:
                        <asp:TextBox ID="TASKNAMETextBox" runat="server" Text='<%# Bind("TASKNAME") %>' CssClass="form-control" />
                        <br />
                        START DATE:
                        <asp:TextBox ID="TASKSTARTDATETextBox" runat="server" Text='<%# Bind("TASKSTARTDATE") %>' CssClass="form-control" />
                        <br />
                        STATUS:
                        <asp:TextBox ID="TASKSTATUSTextBox" runat="server" Text='<%# Bind("TASKSTATUS") %>' CssClass="form-control" />
                        <br />
                        DUE DATE:
                        <asp:TextBox ID="TASKDUEDATETextBox" runat="server" Text='<%# Bind("TASKDUEDATE") %>' CssClass="form-control" />
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