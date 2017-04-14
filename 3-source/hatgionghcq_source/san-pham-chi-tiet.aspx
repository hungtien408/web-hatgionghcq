<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="san-pham-chi-tiet.aspx.cs" Inherits="san_pham_chi_tiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <div class="site">
        <asp:ListView ID="lstBreadcrum" runat="server" DataSourceID="odsBreadcrum"
            EnableModelValidation="True">
            <ItemTemplate>
                <%# "<a href='" + progressTitle(Eval("ProductCategoryName")) + "-pci-" + Eval("ProductCategoryID") + ".aspx" + "'>" + Eval("ProductCategoryName") + " <span class='glyphicon glyphicon-triangle-right'></span></a>"%>
            </ItemTemplate>
            <LayoutTemplate>
                <a id="A2" href="~/" runat="server">Trang chủ <span class="glyphicon glyphicon-triangle-right"></span></a>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsBreadcrum" runat="server"
            SelectMethod="ProductCategoryHierarchyToTopSelectAll"
            TypeName="TLLib.ProductCategory">
            <SelectParameters>
                <asp:QueryStringParameter Name="CurrentProductCategoryID" QueryStringField="pci" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:Label ID="lblProductTitle" runat="server"></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">
    <asp:ListView ID="lstProductDetails" runat="server" DataSourceID="odsProductDetails"
        EnableModelValidation="True">
        <ItemTemplate>
            <div class="product-detail">
                <div id="detailsImg" class="detail-images">
                    <div class="detail-desktop">
                        <div class="wrap-images">
                            <a id="zoom1" href="assets/images/product-big-1.jpg" class="cloud-zoom" rel="transparentImage: 'data:image/gif;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==', useWrapper: false, showTitle: false, zoomWidth:'350', zoomHeight:'350', adjustY:0, adjustX:2">
                                <img src="assets/images/product-img-1.jpg" title="Sample Title" alt="" /></a>
                        </div>
                        <div class="wrap-small">
                            <div class="details-four">
                                <asp:ListView ID="lstProductAlbum" runat="server" DataSourceID="odsProductAlbum"
                                    EnableModelValidation="True">
                                    <ItemTemplate>
                                        <div class="slick-iteams" data-img='<%# "/res/product/album/" + Eval("ImageName") %>'>
                                            <a href='<%# "/res/product/album/" + Eval("ImageName") %>' class='cloud-zoom-gallery small-in' rel="useZoom: 'zoom1', smallImage: '<%# "/res/product/album/" + Eval("ImageName") %>' ">
                                                <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/product/album/thumbs/" + Eval("ImageName") %>'
                                                    visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                                    runat="server" /></a>
                                        </div>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <span runat="server" id="itemPlaceholder" />
                                    </LayoutTemplate>
                                </asp:ListView>
                                <asp:ObjectDataSource ID="odsProductAlbum" runat="server" SelectMethod="ProductImageSelectAll"
                                    TypeName="TLLib.ProductImage">
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="pi" Name="ProductID" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                        <asp:Parameter Name="Priority" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="detail-content">
                    <h2 class="title"><%# Eval("ProductName") %></h2>
                    <span><%# !string.IsNullOrEmpty(Eval("Price").ToString()) ? (string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " đ") : ""%></span>
                    <div class="desription">
                        <%# Eval("Description") %>
                    </div>
                    <div class="number">
                        Số lượng:
                    <div class="sp-quantity">
                        <div class="sp-input">
                            <input type="text" class="quntity-input" value="0" />
                        </div>
                    </div>
                    </div>
                    <p style="margin: 10px 0;">Tình trạng: <span style="color: #348904;"><%# Eval("Tag") %></span></p>
                    <div class="btn-in-cart">
                        <a href="#">+ Thêm vào giỏ hàng</a>
                        <a href="#">Mua ngay</a>
                    </div>
                </div>
                <div class="clr">
                </div>
            </div>
            <div class="product-detail-content">
                <div class="head-detail">
                    <div class="title-product">
                        <h4>Chi tiết <%# Eval("ProductName") %></h4>
                    </div>
                </div>
                <div class="wrap-content-sp">
                    <%# Eval("Content") %>
                </div>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsProductDetails" runat="server" SelectMethod="ProductSelectOne"
        TypeName="TLLib.Product">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ListView ID="lstProductCategory2" runat="server" DataSourceID="odsProductCategory2"
        EnableModelValidation="True">
        <ItemTemplate>
            <div class="container">
                <div class="wrapper-product product-slider">
                    <div class="jcarousel-wrapper">
                        <div class="head-control">
                            <div class="bg-title"></div>
                            <h2 class="title-2 title-tb"><%# Eval("ProductCategoryName") %></h2>
                            <div class="product-control">
                                <a href="#" class="prev jcarousel-prev navigation-btn"></a>
                                <a href="#" class="next jcarousel-next navigation-btn"></a>
                            </div>
                        </div>
                        <asp:HiddenField ID="hdnProductCategoryID" Value='<%# Eval("ProductCategoryID") %>' runat="server" />
                        <div class="jcarousel">
                            <asp:ListView ID="lstProduct" runat="server" DataSourceID="odsProduct"
                                EnableModelValidation="True">
                                <ItemTemplate>
                                    <li>
                                        <div class="products-box">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>' class="product-img">
                                                <img class="img-responsive" alt='<%# Eval("ImageName") %>' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                                    visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                                    runat="server" />
                                            </a>
                                            <h3 class="product-name"><a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'><%# Eval("ProductName") %></a></h3>
                                            <span><%# !string.IsNullOrEmpty(Eval("Price").ToString()) ? (string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " đ") : ""%></span>
                                            <i><%# !string.IsNullOrEmpty(Eval("SavePrice").ToString()) ? (string.Format("{0:##,###.##}", Eval("SavePrice")).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " đ") : ""%></i>
                                        </div>
                                    </li>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <ul>
                                        <li runat="server" id="itemPlaceholder"></li>
                                    </ul>
                                </LayoutTemplate>
                            </asp:ListView>
                            <asp:ObjectDataSource ID="odsProduct" runat="server" SelectMethod="ProductSelectAll"
                                TypeName="TLLib.Product">
                                <SelectParameters>
                                    <asp:Parameter Name="StartRowIndex" Type="String" />
                                    <asp:Parameter Name="EndRowIndex" Type="String" />
                                    <asp:Parameter Name="Keyword" Type="String" />
                                    <asp:Parameter Name="ProductName" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter Name="PriceFrom" Type="String" />
                                    <asp:Parameter Name="PriceTo" Type="String" />
                                    <asp:ControlParameter ControlID="hdnProductCategoryID" PropertyName="Value" Name="CategoryID" Type="String" />
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
                </div>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsProductCategory2" runat="server"
        SelectMethod="ProductCategorySelectOne" TypeName="TLLib.ProductCategory">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="pci" Name="ProductCategoryID" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

