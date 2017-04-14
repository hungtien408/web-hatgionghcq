<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="tin-tuc-chi-tiet.aspx.cs" Inherits="dich_vu_chi_tiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <div class="site">
        <a id="A1" href="~/" runat="server">Trang chủ <span class="glyphicon glyphicon-triangle-right"></span></a>
        <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
    <asp:ListView ID="lstNew" runat="server" DataSourceID="odsNew"
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
    <asp:ObjectDataSource ID="odsNew" runat="server" SelectMethod="ProductSelectOne"
        TypeName="TLLib.Product">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="tt" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

