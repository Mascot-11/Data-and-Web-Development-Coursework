<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Task.aspx.cs" Inherits="DataWebDev.Simple_Web_Forms.Task" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="TASKID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="TASKID" HeaderText="TASKID" ReadOnly="True" SortExpression="TASKID" />
                    <asp:BoundField DataField="TASKNAME" HeaderText="TASKNAME" SortExpression="TASKNAME" />
                    <asp:BoundField DataField="TASKSTARTDATE" HeaderText="TASKSTARTDATE" SortExpression="TASKSTARTDATE" />
                    <asp:BoundField DataField="TASKSTATUS" HeaderText="TASKSTATUS" SortExpression="TASKSTATUS" />
                    <asp:BoundField DataField="TASKDUEDATE" HeaderText="TASKDUEDATE" SortExpression="TASKDUEDATE" />
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
            <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="TASKID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
                <EditItemTemplate>
                    TASKID:
                    <asp:Label ID="TASKIDLabel1" runat="server" Text='<%# Eval("TASKID") %>' />
                    <br />
                    TASKNAME:
                    <asp:TextBox ID="TASKNAMETextBox" runat="server" Text='<%# Bind("TASKNAME") %>' />
                    <br />
                    TASKSTARTDATE:
                    <asp:TextBox ID="TASKSTARTDATETextBox" runat="server" Text='<%# Bind("TASKSTARTDATE") %>' />
                    <br />
                    TASKSTATUS:
                    <asp:TextBox ID="TASKSTATUSTextBox" runat="server" Text='<%# Bind("TASKSTATUS") %>' />
                    <br />
                    TASKDUEDATE:
                    <asp:TextBox ID="TASKDUEDATETextBox" runat="server" Text='<%# Bind("TASKDUEDATE") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    TASKID:
                    <asp:TextBox ID="TASKIDTextBox" runat="server" Text='<%# Bind("TASKID") %>' />
                    <br />
                    TASKNAME:
                    <asp:TextBox ID="TASKNAMETextBox" runat="server" Text='<%# Bind("TASKNAME") %>' />
                    <br />
                    TASKSTARTDATE:
                    <asp:TextBox ID="TASKSTARTDATETextBox" runat="server" Text='<%# Bind("TASKSTARTDATE") %>' />
                    <br />
                    TASKSTATUS:
                    <asp:TextBox ID="TASKSTATUSTextBox" runat="server" Text='<%# Bind("TASKSTATUS") %>' />
                    <br />
                    TASKDUEDATE:
                    <asp:TextBox ID="TASKDUEDATETextBox" runat="server" Text='<%# Bind("TASKDUEDATE") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    TASKID:
                    <asp:Label ID="TASKIDLabel" runat="server" Text='<%# Eval("TASKID") %>' />
                    <br />
                    TASKNAME:
                    <asp:Label ID="TASKNAMELabel" runat="server" Text='<%# Bind("TASKNAME") %>' />
                    <br />
                    TASKSTARTDATE:
                    <asp:Label ID="TASKSTARTDATELabel" runat="server" Text='<%# Bind("TASKSTARTDATE") %>' />
                    <br />
                    TASKSTATUS:
                    <asp:Label ID="TASKSTATUSLabel" runat="server" Text='<%# Bind("TASKSTATUS") %>' />
                    <br />
                    TASKDUEDATE:
                    <asp:Label ID="TASKDUEDATELabel" runat="server" Text='<%# Bind("TASKDUEDATE") %>' />
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
