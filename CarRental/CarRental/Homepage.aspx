<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="CarRental.Homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/StyleSheet2.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <section>
        <img src="images/logo1.jpg" class="img-fluid"/>
    </section>
      
   <!-- MOdal to show saved cart -->
    <div class="container-fluid">
        
       <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        
                        <h4 class="modal-title"><asp:Label ID="lblModalTitle" runat="server" Text=""></asp:Label></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <asp:Label ID="lblModalBody" runat="server" Text=""></asp:Label>
                        <p>Follow <a href="SavedCart.aspx" class="tooltip-test" title="Tooltip"> this link</a> to go to your saved cart.</p>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
       <div class="row">
           <!--Left Side of Page-->

            <div class="col-md-5 col-sm-3" >
                    <!--=== LUXURY ===-->
                    <div id="luxury">
                        <p class="Space">
                            LUXURY
                            CARS 
                            <span class="offer">5% OFFER AT WEEKENDS 
                             OR WEEKDAYS
                            </span>
                            <asp:Button ID="Button1" runat="server" Text="READ MORE"  BackColor="#1B1B1B" 
                                ForeColor="wheat" Font-Size="15px" Font-Bold="true"  BorderStyle="Solid" 
                                BorderWidth="1" white-space="pre-line" line-height="0px" 
                                Height="50px" OnClick="Button1_Click" />
                           
                        </p>
                       
                    </div>
                <br />
                <!--=== DEALS ===-->
                 <div id="luxury1">
                      
                        <p class="Space">
                            SPECIAL 
                            OFFERS 
                            <span class="offer">10% OFF AT FIRST
                             CHECKOUT
                            </span>
                            <asp:Button ID="Button2" runat="server" Text="READ MORE"  BackColor="#1B1B1B" ForeColor="wheat" 
                                Font-Size="15px" Font-Bold="true"  BorderStyle="Solid" BorderWidth="1" white-space="pre-line" 
                                line-height="0px" Height="50px" />
                           
                        </p>
                    </div>
                
            </div>
           <!--Right Side of Page-->
           <div class="col-md-7 col-sm-9">
                <!--=== SERVICE DETAILS ===-->
               <div id="intro">
                   <p>
                       THE BEST PLACE FOR FINDING<br />
                       CAR SERVICES AND RENTAL<br />
                   </p>
                   <p class="place">
                       Maecenas volutpat, odio eget imperdiet faucibus, dui diam placerat turpis, non<br /> 
                       semper leo quam fringilla orci. Etiam vitae fringilla leo. Cras mollis ex vel mauris<br />
                       ullamcorper porta. Proin est felis, venenatis sed ex sit amet, luctus dictum tellus.<br /> 
                       Etiam porttitor, felis facilisis feugiat egestas, mi ipsum varius tortor, vel varius <br />
                       lorem nulla non tortor. Nulla vel ligula vehicula, posuere erat imperdiet, <br />
                       consequat ante. Sed vestibulum, elit non interdum tempor, diam justo venenatis<br />
                       arcu, eget ullamcorper elit ex sed risus. Ut sagittis tincidunt lectus, id tempor <br />
                       felis auctor eu. Donec feugiat vehicula risus ut tristique.<br />
                   </p>
                        <asp:Button ID="Button7" class ="mb-4" runat="server" Text="READ MORE"  BackColor="#1B1B1B" ForeColor="wheat" Font-Size="15px" Font-Bold="true"  BorderStyle="Solid" BorderWidth="1" white-space="pre-line" line-height="0px" Height="50px" OnClick="Button7_Click" />

               </div>
                <!--=== CAR PRICE ===-->
               <div id="second_tag">
                   <img src ="images/ferrari2.jpg" class="img-fluid car-price" />
                    <div id ="top-left">
                       CAR PRICE
                       <p class="place">
                       Donec augue enim, volutpat at ligula et, dictum laoreet sapien. <br />
                      Sed maximus feugiat tincidunt. Vestibulum ante<br />
                      ipsum primis in faucibus orci luctus 
                      </p>
                        <asp:Button ID="Button3" runat="server" Text="READ MORE"  BackColor="#1B1B1B" ForeColor="wheat" Font-Size="15px" Font-Bold="true"  BorderStyle="Solid" BorderWidth="1" white-space="pre-line" line-height="0px" Height="50px" OnClick="Button3_Click" />
                   </div>
                   
                  
               </div>   
               <!--=== ABOUT===-->
               <div id="third_tag">
                   <div id="about">
                       ABOUT US
                       <p class="place">
                           Praesent a lectus turpis. Sed malesuada dolor nec mi scelerisque sem non congue sapien<br />
                           fringilla nec. Nulla facilisi. Cras vitae nunc vehicula, tincidunt Nunc iaculis ipsum eget,<br />
                            accumsan urna.  efficitur lacus sit amet ornare.Cras ac ultrices nisi, a ullamcorper leo.<br />
                             Nunc bibendum vulputate porttitor. Nunc nec magna eget augue vehicula porta.<br />
                            Aliquam vitae massa arcu. Duis lorem nisi,pretium tincidunt nulla.<br />
                       </p>
                        <asp:Button ID="Button4" runat="server" Text="READ MORE"  BackColor="red" ForeColor="FloralWhite" Font-Size="15px" Font-Bold="true"  BorderStyle="Solid" BorderWidth="1" white-space="pre-line" line-height="0px" Height="50px" OnClick="Button4_Click" />

                   </div>
               </div>

           </div>
        </div>
    </div>

    
  
</asp:Content>
