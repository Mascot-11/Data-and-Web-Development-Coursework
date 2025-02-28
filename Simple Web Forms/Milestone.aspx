<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Milestone.aspx.cs" Inherits="DataWebDev.Simple_Web_Forms.Milestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MILESTONEID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="MILESTONEID" HeaderText="MILESTONEID" ReadOnly="True" SortExpression="MILESTONEID" />
                    <asp:BoundField DataField="MILESTONENAME" HeaderText="MILESTONENAME" SortExpression="MILESTONENAME" />
                    <asp:BoundField DataField="MILESTONEDUEDATE" HeaderText="MILESTONEDUEDATE" SortExpression="MILESTONEDUEDATE" />
                    <asp:BoundField DataField="PROJECTS_PROJECTID" HeaderText="PROJECTS_PROJECTID" SortExpression="PROJECTS_PROJECTID" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MILESTONE&quot; WHERE &quot;MILESTONEID&quot; = :MILESTONEID" InsertCommand="INSERT INTO &quot;MILESTONE&quot; (&quot;MILESTONEID&quot;, &quot;MILESTONENAME&quot;, &quot;MILESTONEDUEDATE&quot;, &quot;PROJECTS_PROJECTID&quot;) VALUES (:MILESTONEID, :MILESTONENAME, :MILESTONEDUEDATE, :PROJECTS_PROJECTID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONEID&quot;, &quot;MILESTONENAME&quot;, &quot;MILESTONEDUEDATE&quot;, &quot;PROJECTS_PROJECTID&quot; FROM &quot;MILESTONE&quot;" UpdateCommand="UPDATE &quot;MILESTONE&quot; SET &quot;MILESTONENAME&quot; = :MILESTONENAME, &quot;MILESTONEDUEDATE&quot; = :MILESTONEDUEDATE, &quot;PROJECTS_PROJECTID&quot; = :PROJECTS_PROJECTID WHERE &quot;MILESTONEID&quot; = :MILESTONEID">
                <DeleteParameters>
                    <asp:Parameter Name="MILESTONEID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MILESTONEID" Type="Decimal" />
                    <asp:Parameter Name="MILESTONENAME" Type="String" />
                    <asp:Parameter Name="MILESTONEDUEDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECTS_PROJECTID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MILESTONENAME" Type="String" />
                    <asp:Parameter Name="MILESTONEDUEDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECTS_PROJECTID" Type="Decimal" />
                    <asp:Parameter Name="MILESTONEID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MILESTONEID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
                <EditItemTemplate>
                    MILESTONEID:
                    <asp:Label ID="MILESTONEIDLabel1" runat="server" Text='<%# Eval("MILESTONEID") %>' />
                    <br />
                    MILESTONENAME:
                    <asp:TextBox ID="MILESTONENAMETextBox" runat="server" Text='<%# Bind("MILESTONENAME") %>' />
                    <br />
                    MILESTONEDUEDATE:
                    <asp:TextBox ID="MILESTONEDUEDATETextBox" runat="server" Text='<%# Bind("MILESTONEDUEDATE") %>' />
                    <br />
                    PROJECTS_PROJECTID:
                    <asp:TextBox ID="PROJECTS_PROJECTIDTextBox" runat="server" Text='<%# Bind("PROJECTS_PROJECTID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    MILESTONEID:
                    <asp:TextBox ID="MILESTONEIDTextBox" runat="server" Text='<%# Bind("MILESTONEID") %>' />
                    <br />
                    MILESTONENAME:
                    <asp:TextBox ID="MILESTONENAMETextBox" runat="server" Text='<%# Bind("MILESTONENAME") %>' />
                    <br />
                    MILESTONEDUEDATE:
                    <asp:TextBox ID="MILESTONEDUEDATETextBox" runat="server" Text='<%# Bind("MILESTONEDUEDATE") %>' />
                    <br />
                    PROJECTS_PROJECTID:
                    <asp:TextBox ID="PROJECTS_PROJECTIDTextBox" runat="server" Text='<%# Bind("PROJECTS_PROJECTID") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    MILESTONEID:
                    <asp:Label ID="MILESTONEIDLabel" runat="server" Text='<%# Eval("MILESTONEID") %>' />
                    <br />
                    MILESTONENAME:
                    <asp:Label ID="MILESTONENAMELabel" runat="server" Text='<%# Bind("MILESTONENAME") %>' />
                    <br />
                    MILESTONEDUEDATE:
                    <asp:Label ID="MILESTONEDUEDATELabel" runat="server" Text='<%# Bind("MILESTONEDUEDATE") %>' />
                    <br />
                    PROJECTS_PROJECTID:
                    <asp:Label ID="PROJECTS_PROJECTIDLabel" runat="server" Text='<%# Bind("PROJECTS_PROJECTID") %>' />
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
