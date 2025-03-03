<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users Project.aspx.cs" Inherits="DataWebDev.Complex_Web_Forms.Project_Milestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="USERNAME" DataValueField="USERID">
            </asp:DropDownList>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USERID,PROJECTID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True" SortExpression="USERID" />
                    <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                    <asp:BoundField DataField="USERROLE" HeaderText="USERROLE" SortExpression="USERROLE" />
                    <asp:BoundField DataField="USERCONTACT" HeaderText="USERCONTACT" SortExpression="USERCONTACT" />
                    <asp:BoundField DataField="PROJECTID" HeaderText="PROJECTID" ReadOnly="True" SortExpression="PROJECTID" />
                    <asp:BoundField DataField="PROJECTNAME" HeaderText="PROJECTNAME" SortExpression="PROJECTNAME" />
                    <asp:BoundField DataField="PROJECTSTARTDATE" HeaderText="PROJECTSTARTDATE" SortExpression="PROJECTSTARTDATE" />
                    <asp:BoundField DataField="PROJECTENDDATE" HeaderText="PROJECTENDDATE" SortExpression="PROJECTENDDATE" />
                    <asp:BoundField DataField="PROJECTSTATUS" HeaderText="PROJECTSTATUS" SortExpression="PROJECTSTATUS" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
