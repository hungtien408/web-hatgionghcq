<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="lien-he.aspx.cs" Inherits="lien_he" %>

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
                        <ul>
                            <li><i class="fa fa-map-marker"></i>111 Tên Lửa, P.Bình Trị Đông, Q.Bình Tân</li>
                            <li><i class="fa fa-mobile"></i>08.3856.1489 - 0907 018 309</li>
                            <li><i class="fa fa-facebook-official"></i><a href="www.facebook.com/hatgiong" target="_blank">www.facebook.com/hatgiong</a></li>
                            <li><i class="fa fa-link"></i><a href="www.hatgiong.vn">www.hatgiong.vn</a></li>
                        </ul>
                        <p>Mọi ý kiến thắc mắc hay nhu cầu đặt hàng số lượng lớn hay cần tư vấn giải pháp cho cây trồng... hãy liên hệ với chúng tôi</p>
                        <div class="form-wrap">
                            <div class="form-group">
                                <label>Họ tên <span>*</span></label>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Email <span>*</span></label>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Điện thoại <span>*</span></label>
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Nội dung <span>*</span></label>
                                <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <asp:Button ID="Button1" runat="server" Text="GỬI" />
                            <span class="note">*<i>Thông tin bắt buộc</i></span>
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

