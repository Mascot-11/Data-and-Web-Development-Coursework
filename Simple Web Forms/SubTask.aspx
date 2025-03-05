<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubTask.aspx.cs" Inherits="DataWebDev.Simple_Web_Forms.SubTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SubTask Management</title>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SUBTASK&quot; WHERE &quot;SUBTASKID&quot; = :SUBTASKID" InsertCommand="INSERT INTO &quot;SUBTASK&quot; (&quot;SUBTASKID&quot;, &quot;SUBTASKSTATUS&quot;, &quot;SUBTASKNAME&quot;, &quot;TASKS_TASKID&quot;, &quot;USERS_USERID&quot;) VALUES (:SUBTASKID, :SUBTASKSTATUS, :SUBTASKNAME, :TASKS_TASKID, :USERS_USERID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;SUBTASKID&quot;, &quot;SUBTASKSTATUS&quot;, &quot;SUBTASKNAME&quot;, &quot;TASKS_TASKID&quot;, &quot;USERS_USERID&quot; FROM &quot;SUBTASK&quot;" UpdateCommand="UPDATE &quot;SUBTASK&quot; SET &quot;SUBTASKSTATUS&quot; = :SUBTASKSTATUS, &quot;SUBTASKNAME&quot; = :SUBTASKNAME, &quot;TASKS_TASKID&quot; = :TASKS_TASKID, &quot;USERS_USERID&quot; = :USERS_USERID WHERE &quot;SUBTASKID&quot; = :SUBTASKID">
                    <DeleteParameters>
                        <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                        <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                        <asp:Parameter Name="SUBTASKNAME" Type="String" />
                        <asp:Parameter Name="TASKS_TASKID" Type="Decimal" />
                        <asp:Parameter Name="USERS_USERID" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                        <asp:Parameter Name="SUBTASKNAME" Type="String" />
                        <asp:Parameter Name="TASKS_TASKID" Type="Decimal" />
                        <asp:Parameter Name="USERS_USERID" Type="Decimal" />
                        <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKNAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-hover" AllowPaging="True">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="SUBTASKID" HeaderText="SUBTASK ID" ReadOnly="True" SortExpression="SUBTASKID" />
                        <asp:BoundField DataField="SUBTASKSTATUS" HeaderText="SUBTASK STATUS" SortExpression="SUBTASKSTATUS" />
                        <asp:BoundField DataField="SUBTASKNAME" HeaderText="SUBTASK NAME" SortExpression="SUBTASKNAME" />
                        <asp:BoundField DataField="TASKS_TASKID" HeaderText="TASK ID" SortExpression="TASKS_TASKID" />
                        <asp:BoundField DataField="USERS_USERID" HeaderText="USER ID" SortExpression="USERS_USERID" />
                        <asp:TemplateField HeaderText="Task &amp; User Name">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASKNAME"  DataValueField="TASKID" SelectedValue='<%# Bind("TASKS_TASKID") %>' CssClass="form-select">
                                </asp:DropDownList>
                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="USERNAME"  DataValueField="USERID" SelectedValue='<%# Bind("USERS_USERID") %>' CssClass="form-select">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:FormView ID="FormView1" runat="server" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1">
                    <EditItemTemplate>
                        SUBTASK ID:
                        <asp:Label ID="SUBTASKIDLabel" runat="server" Text='<%# Eval("SUBTASKID") %>' />
                        <br />
                        SUBTASK STATUS:
                        <asp:TextBox ID="SUBTASKSTATUSTextBox" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' CssClass="form-control" />
                        <br />
                        SUBTASK NAME:
                        <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' CssClass="form-control" />
                        <br />
                        TASK:
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASKNAME" DataValueField="TASKID" SelectedValue='<%# Bind("TASKS_TASKID") %>' CssClass="form-select">
                        </asp:DropDownList>
                        <br />
                        USER:
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="USERNAME" DataValueField="USERID" SelectedValue='<%# Bind("USERS_USERID") %>' CssClass="form-select">
                        </asp:DropDownList>
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        SUBTASK ID:
                        <asp:TextBox ID="SUBTASKIDTextBox" runat="server" Text='<%# Bind("SUBTASKID") %>' CssClass="form-control" />
                        <br />
                        SUBTASK STATUS:
                        <asp:TextBox ID="SUBTASKSTATUSTextBox" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' CssClass="form-control" />
                        <br />
                        SUBTASK NAME:
                        <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' CssClass="form-control" />
                        <br />
                        TASK:
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASKNAME" DataValueField="TASKID" SelectedValue='<%# Bind("TASKS_TASKID") %>' CssClass="form-select">
                        </asp:DropDownList>
                        <br />
                        USER:
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="USERNAME" DataValueField="USERID" SelectedValue='<%# Bind("USERS_USERID") %>' CssClass="form-select">
                        </asp:DropDownList>
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