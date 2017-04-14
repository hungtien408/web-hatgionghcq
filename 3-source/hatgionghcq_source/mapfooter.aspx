<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mapfooter.aspx.cs" Inherits="mapfooter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="assets/styles/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/styles/site.css" rel="stylesheet" />
    <script src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=vi&key=AIzaSyBvqpKLkMPehfFi64UFBGPyTDRocpMBh2U"></script>
    <script type="text/javascript">
        mapfooter();
        /*============================*/
        function mapfooter() {
            var lat = 10.746273;
            var long = 106.612312;
            var myCenter = new google.maps.LatLng(lat, long);

            function initialize() {
                var mapProp = {
                    center: myCenter,
                    zoom: 17,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };

                var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

                var marker = new google.maps.Marker({
                    position: myCenter,
                });

                marker.setMap(map);
            }

            google.maps.event.addDomListener(window, 'load', initialize);
        }
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="map-boxs"><div id="googleMap"></div></div>
    </form>
</body>
</html>
