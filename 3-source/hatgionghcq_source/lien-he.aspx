<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="lien-he.aspx.cs" Inherits="lien_he" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Hạt Giống</title>
    <meta name="description" content="Hạt Giống" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrapper-content">
        <div class="container">
            <div class="site">
                <a id="A1" href="~/" runat="server">Trang chủ <span class="glyphicon glyphicon-triangle-right"></span></a>
                <span>Liên Hệ</span>
            </div>
            <div class="wrapper-text about-us">
                <h1 class="title">Liên hệ</h1>
                <div class="wrap-lienhe">
                    <div class="content-lh">
                        <asp:ListView ID="lstInfo" runat="server" DataSourceID="odsInfo"
                            EnableModelValidation="True">
                            <ItemTemplate>
                                <ul>
                                    <li><i class="fa fa-map-marker"></i><%# Eval("Description") %></li>
                                    <li><i class="fa fa-mobile"></i><%# Eval("MetaTittle") %></li>
                                    <li><i class="fa fa-facebook-official"></i><a href='<%# Eval("MetaTittleEn") %>' target="_blank"><%# Eval("MetaTittleEn") %></a></li>
                                    <li><i class="fa fa-link"></i><a href='<%# Eval("MetaDescriptionEn") %>' target="_blank"><%# Eval("MetaDescriptionEn") %></a></li>
                                </ul>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <span runat="server" id="itemPlaceholder" />
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsInfo" runat="server" SelectMethod="ProductSelectAll"
                            TypeName="TLLib.Product">
                            <SelectParameters>
                                <asp:Parameter Name="StartRowIndex" Type="String" />
                                <asp:Parameter Name="EndRowIndex" Type="String" />
                                <asp:Parameter Name="Keyword" Type="String" />
                                <asp:Parameter Name="ProductName" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="PriceFrom" Type="String" />
                                <asp:Parameter Name="PriceTo" Type="String" />
                                <asp:Parameter DefaultValue="5" Name="CategoryID" Type="String" />
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
                        <p>Mọi ý kiến thắc mắc hay nhu cầu đặt hàng số lượng lớn hay cần tư vấn giải pháp cho cây trồng... hãy liên hệ với chúng tôi</p>
                        <div class="form-wrap">
                            <div class="form-group">
                                <label>Họ tên <span>*</span></label>
                                <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                    Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtFullName"
                                    ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Email <span>*</span></label>
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                                    runat="server" ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Email is error!"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                                    ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                    ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Information required!"
                                    Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Điện thoại <span>*</span></label>
                                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator5" runat="server"
                                    Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtPhone" ErrorMessage="Information required!"
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Nội dung <span>*</span></label>
                                <asp:TextBox ID="txtNoiDung" runat="server" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                                    ValidationGroup="SendEmail" Display="Dynamic" ControlToValidate="txtNoiDung"
                                    ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label style="float: left;">Code <span>*</span></label>
                                <asp:TextBox ID="txtVerifyCode" runat="server" CssClass="text-code"></asp:TextBox>
                                <asp:RadCaptcha ID="RadCaptcha1" ValidatedTextBoxID="txtVerifyCode" ValidationGroup="SendEmail"
                                    runat="server" Display="Dynamic"
                                    ErrorMessage="Mã xác nhận: không chính xác." CaptchaLinkButtonText="Refesh"
                                    CssClass="capcha" EnableRefreshImage="True">
                                    <captchaimage renderimageonly="True" width="115" height="31" backgroundnoise="High" backgroundcolor="White" textcolor="Black" fontfamily="Tohoma" textlength="5" imagecssclass="code-img" />
                                </asp:RadCaptcha>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="btnGui" runat="server" Text="GỬI" OnClick="btnGui_Click" ValidationGroup="SendEmail" />
                                <span class="note">*<i>Thông tin bắt buộc</i></span>
                            </div>
                        </div>
                    </div>
                    <div class="img-lh">
                        <img src="assets/images/lh.jpg" alt="" />
                        <div id="map"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBottom" runat="Server">
</asp:Content>

