<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="wrapper-home row">
            <div class="col-md-3 col-xs-3">
                <div class="menu-product">
                    <asp:ListView ID="lstProductCategory" runat="server" DataSourceID="odsProductCategory"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <li><a href='<%# progressTitle(Eval("ProductCategoryName")) + "-pci-" + Eval("ProductCategoryID") + ".aspx" %>'><%# Eval("ProductCategoryName") %></a></li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul>
                                <li runat="server" id="itemPlaceholder"></li>
                            </ul>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsProductCategory" runat="server"
                        SelectMethod="ProductCategorySelectAll" TypeName="TLLib.ProductCategory">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="3" Name="parentID" Type="Int32" />
                            <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                            <asp:Parameter DefaultValue="True" Name="IsShowOnMenu" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <div class="menu-product-footer">
                        <img class="img-responsive" src="assets/images/bg-pro-menu-footer.png" alt="" />
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xs-6">
                <div id="banner">
                    <div class="slider-wrapper">
                        <div id="slidernopage" class="nivoSlider">
                            <asp:ListView ID="lstBanner" runat="server" DataSourceID="odsBanner"
                                EnableModelValidation="True">
                                <ItemTemplate>
                                    <a href="javascript:void(0);">
                                        <img alt='<%# Eval("FileName") %>' src='<%# "~/res/advertisement/" + Eval("FileName") %>'
                                            visible='<%# string.IsNullOrEmpty( Eval("FileName").ToString()) ? false : true %>'
                                            runat="server" /></a>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <span runat="server" id="itemPlaceholder" />
                                </LayoutTemplate>
                            </asp:ListView>
                            <asp:ObjectDataSource ID="odsBanner" runat="server" SelectMethod="AdsBannerSelectAll"
                                TypeName="TLLib.AdsBanner">
                                <SelectParameters>
                                    <asp:Parameter Name="StartRowIndex" Type="String" />
                                    <asp:Parameter Name="EndRowIndex" Type="String" />
                                    <asp:Parameter DefaultValue="5" Name="AdsCategoryID" Type="String" />
                                    <asp:Parameter Name="CompanyName" Type="String" />
                                    <asp:Parameter Name="Website" Type="String" />
                                    <asp:Parameter Name="FromDate" Type="String" />
                                    <asp:Parameter Name="ToDate" Type="String" />
                                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                    <asp:Parameter Name="Priority" Type="String" />
                                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-xs-3">
                <div class="banner-img">
                    <asp:ListView ID="lstBannerSub" runat="server" DataSourceID="odsBannerSub"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="banner-box">
                                <img alt='<%# Eval("FileName") %>' src='<%# "~/res/advertisement/" + Eval("FileName") %>'
                                    visible='<%# string.IsNullOrEmpty( Eval("FileName").ToString()) ? false : true %>'
                                    runat="server" />
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsBannerSub" runat="server" SelectMethod="AdsBannerSelectAll"
                        TypeName="TLLib.AdsBanner">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                            <asp:Parameter DefaultValue="2" Name="EndRowIndex" Type="String" />
                            <asp:Parameter DefaultValue="6" Name="AdsCategoryID" Type="String" />
                            <asp:Parameter Name="CompanyName" Type="String" />
                            <asp:Parameter Name="Website" Type="String" />
                            <asp:Parameter Name="FromDate" Type="String" />
                            <asp:Parameter Name="ToDate" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
        </div>
    </div>
    <div class="about">
        <div class="container">
            <div class="row">
                <asp:ListView ID="lstAbout" runat="server" DataSourceID="odsAbout"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="col-md-6">
                            <div class="wrap-about">
                                <h2><%# Eval("ProductName") %></h2>
                                <div class="description">
                                    <%# Eval("Description") %>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:HiddenField ID="hdnProductID" Value='<%# Eval("ProductID") %>' runat="server" />
                            <asp:ListView ID="lstListAbout" runat="server" DataSourceID="odsProductAlbum"
                                EnableModelValidation="True">
                                <ItemTemplate>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/product/album/" + Eval("ImageName") %>'
                                                visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                                runat="server" />
                                        </a>
                                        <h3 class="listw-name"><a href="javascript:void(0);"><%# Eval("Title") %></a></h3>
                                    </li>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <ul class="list-about">
                                        <li runat="server" id="itemPlaceholder"></li>
                                    </ul>
                                </LayoutTemplate>
                            </asp:ListView>
                            <asp:ObjectDataSource ID="odsProductAlbum" runat="server" SelectMethod="ProductImageSelectAll"
                                TypeName="TLLib.ProductImage">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hdnProductID" PropertyName="Value" Name="ProductID" Type="String" />
                                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                    <asp:Parameter Name="Priority" Type="String" />
                                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsAbout" runat="server" SelectMethod="ProductSelectAll"
                    TypeName="TLLib.Product">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                        <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="PriceFrom" Type="String" />
                        <asp:Parameter Name="PriceTo" Type="String" />
                        <asp:Parameter DefaultValue="1" Name="CategoryID" Type="String" />
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
        SelectMethod="ProductCategorySelectAll" TypeName="TLLib.ProductCategory">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="parentID" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
            <asp:Parameter Name="IsShowOnMenu" Type="String" />
            <asp:Parameter DefaultValue="True" Name="IsShowOnHomePage" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBottom" runat="Server">
</asp:Content>

