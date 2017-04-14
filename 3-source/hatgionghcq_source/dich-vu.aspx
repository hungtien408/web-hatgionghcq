<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="dich-vu.aspx.cs" Inherits="dich_vu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <div class="site">
        <a id="A1" href="~/" runat="server">Trang chủ <span class="glyphicon glyphicon-triangle-right"></span></a>
        <span>Dịch vụ &amp; Giải pháp</span>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
    <h1 class="title">Dịch vụ &amp; Giải pháp</h1>
    <asp:ListView ID="lstDescriptionService" runat="server" DataSourceID="odsDescriptionService"
        EnableModelValidation="True">
        <ItemTemplate>
            <%# Eval("Description") %>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsDescriptionService" runat="server"
        SelectMethod="ProductCategorySelectOne" TypeName="TLLib.ProductCategory">
        <SelectParameters>
            <asp:Parameter DefaultValue="4" Name="ProductCategoryID" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <div class="service-wrapper">
        <div class="row service-tb">
            <asp:ListView ID="lstService" runat="server" DataSourceID="odsService"
                EnableModelValidation="True">
                <ItemTemplate>
                    <div class="col-xs-4 element-item">
                        <div class="services-box">
                            <a href='<%# progressTitle(Eval("ProductName")) + "-dv-" + Eval("ProductID") + ".aspx" %>' class="service-img">
                                <img class="img-responsive" alt='<%# Eval("ImageName") %>' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                    visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                    runat="server" />
                            </a>
                            <h3 class="service-name"><a href='<%# progressTitle(Eval("ProductName")) + "-dv-" + Eval("ProductID") + ".aspx" %>'><%# Eval("ProductName") %></a></h3>
                            <div class="more-detail"><a href='<%# progressTitle(Eval("ProductName")) + "-dv-" + Eval("ProductID") + ".aspx" %>'>Chi tiết</a></div>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsService" runat="server" SelectMethod="ProductSelectAll"
                TypeName="TLLib.Product">
                <SelectParameters>
                    <asp:Parameter Name="StartRowIndex" Type="String" />
                    <asp:Parameter Name="EndRowIndex" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="PriceFrom" Type="String" />
                    <asp:Parameter Name="PriceTo" Type="String" />
                    <asp:Parameter DefaultValue="4" Name="CategoryID" Type="String" />
                    <asp:Parameter Name="ManufacturerID" Type="String" />
                    <asp:Parameter Name="OriginID" Type="String" />
                    <asp:Parameter Name="Tag" Type="String" />
                    <asp:Parameter Name="InStock" Type="String" />
                    <asp:Parameter Name="IsHot" Type="String" />
                    <asp:Parameter Name="IsNew" Type="String" />
                    <asp:Parameter Name="IsBestSeller" Type="String" />
                    <asp:Parameter Name="IsSaleOff" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                    <asp:Parameter Name="FromDate" Type="String" />
                    <asp:Parameter Name="ToDate" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>

