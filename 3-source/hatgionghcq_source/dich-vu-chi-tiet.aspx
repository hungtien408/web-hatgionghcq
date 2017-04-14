<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="dich-vu-chi-tiet.aspx.cs" Inherits="dich_vu_chi_tiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <div class="site">
        <a id="A1" href="~/" runat="server">Trang chủ <span class="glyphicon glyphicon-triangle-right"></span></a>
        <a href="dich-vu.aspx">Dịch vụ &amp; Giải pháp <span class="glyphicon glyphicon-triangle-right"></span></a>
        <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
    <asp:ListView ID="lstServiceDetail" runat="server" DataSourceID="odsServiceDetail"
        EnableModelValidation="True">
        <ItemTemplate>
            <h1 class="title"><%# Eval("ProductName") %></h1>
            <div class="description">
                <%# Eval("Content") %>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsServiceDetail" runat="server" SelectMethod="ProductSelectOne"
        TypeName="TLLib.Product">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="dv" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

