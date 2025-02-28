<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubTask.aspx.cs" Inherits="DataWebDev.Simple_Web_Forms.SubTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="SUBTASKID" HeaderText="SUBTASKID" ReadOnly="True" SortExpression="SUBTASKID" />
                    <asp:BoundField DataField="SUBTASKSTATUS" HeaderText="SUBTASKSTATUS" SortExpression="SUBTASKSTATUS" />
                    <asp:BoundField DataField="SUBTASKNAME" HeaderText="SUBTASKNAME" SortExpression="SUBTASKNAME" />
                    <asp:BoundField DataField="TASKS_TASKID" HeaderText="TASKS_TASKID" SortExpression="TASKS_TASKID" />
                    <asp:BoundField DataField="USERS_USERID" HeaderText="USERS_USERID" SortExpression="USERS_USERID" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
                <EditItemTemplate>
                    SUBTASKID:
                    <asp:Label ID="SUBTASKIDLabel1" runat="server" Text='<%# Eval("SUBTASKID") %>' />
                    <br />
                    SUBTASKSTATUS:
                    <asp:TextBox ID="SUBTASKSTATUSTextBox" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' />
                    <br />
                    SUBTASKNAME:
                    <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' />
                    <br />
                    TASKS_TASKID:
                    <asp:TextBox ID="TASKS_TASKIDTextBox" runat="server" Text='<%# Bind("TASKS_TASKID") %>' />
                    <br />
                    USERS_USERID:
                    <asp:TextBox ID="USERS_USERIDTextBox" runat="server" Text='<%# Bind("USERS_USERID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    SUBTASKID:
                    <asp:TextBox ID="SUBTASKIDTextBox" runat="server" Text='<%# Bind("SUBTASKID") %>' />
                    <br />
                    SUBTASKSTATUS:
                    <asp:TextBox ID="SUBTASKSTATUSTextBox" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' />
                    <br />
                    SUBTASKNAME:
                    <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' />
                    <br />
                    TASKS_TASKID:
                    <asp:TextBox ID="TASKS_TASKIDTextBox" runat="server" Text='<%# Bind("TASKS_TASKID") %>' />
                    <br />
                    USERS_USERID:
                    <asp:TextBox ID="USERS_USERIDTextBox" runat="server" Text='<%# Bind("USERS_USERID") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    SUBTASKID:
                    <asp:Label ID="SUBTASKIDLabel" runat="server" Text='<%# Eval("SUBTASKID") %>' />
                    <br />
                    SUBTASKSTATUS:
                    <asp:Label ID="SUBTASKSTATUSLabel" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' />
                    <br />
                    SUBTASKNAME:
                    <asp:Label ID="SUBTASKNAMELabel" runat="server" Text='<%# Bind("SUBTASKNAME") %>' />
                    <br />
                    TASKS_TASKID:
                    <asp:Label ID="TASKS_TASKIDLabel" runat="server" Text='<%# Bind("TASKS_TASKID") %>' />
                    <br />
                    USERS_USERID:
                    <asp:Label ID="USERS_USERIDLabel" runat="server" Text='<%# Bind("USERS_USERID") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
            </asp:FormView>
        </div>
    </form>
</body>
</html>
