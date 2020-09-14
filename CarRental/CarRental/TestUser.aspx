<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="TestUser.aspx.cs" Inherits="CarRental.TestUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class=" h3 text-center">All Cars List</div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </asp:Panel>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     
                       
                     </div>
                  </div>
                  
                  <div class="row">
                      
                     <div class="col">
                         <asp:GridView class="table table-striped table-bordered table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CarID" DataSourceID="SqlDataSource1" style="margin-right: 0px">
                            <Columns>
                                <asp:BoundField DataField="CarID" HeaderText="CarID" ReadOnly="True" SortExpression="CarID" >
                                
                                <ItemStyle Font-Bold="True" />
                                </asp:BoundField>
                                
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row ">
                                                <div class="col-lg-10">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ModelName") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="row">
                                                        <div class="col-12">

                                                            Brand-<asp:Label ID="Label2" runat="server" Text='<%# Eval("BrandName") %>' Font-Bold="True"></asp:Label>

                                                            &nbsp; |&nbsp;&nbsp; Service Type-<asp:Label ID="Label3" runat="server" Text='<%# Eval("RentOptions") %>' Font-Bold="True"></asp:Label>

                                                            &nbsp; |&nbsp; Route-<asp:Label ID="Label4" runat="server" Text='<%# Eval("Route") %>' Font-Bold="True"></asp:Label>

                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">

                                                            Engine-<asp:Label ID="Label5" runat="server" Text='<%# Eval("Engine") %>' Font-Bold="True"></asp:Label>

                                                            &nbsp;</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">

                                                            

                                                            Exterior-<asp:Label ID="Label6" runat="server" Text='<%# Eval("Exterior") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp; |&nbsp; Interior-<asp:Label ID="Label7" runat="server" Text='<%# Eval("Interior") %>' Font-Bold="True"></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-12">  
                                                            Arrival Date-<asp:Label ID="Label8" runat="server" Text='<%# Eval("ArrivalDate") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp; |&nbsp; Runs On-<asp:Label ID="Label9" runat="server" Text='<%# Eval("RunsOn") %>' Font-Bold="True"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">  
                                                            Actual Stock-<asp:Label ID="Label10" runat="server" Text='<%# Eval("ActualStock") %>' Font-Bold="True"></asp:Label>
                                                            &nbsp; |&nbsp; Available-<asp:Label ID="Label11" runat="server" Text='<%# Eval("currentStock") %>' Font-Bold="True"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 border-bottom border-dark mb-0 pt-1 mt-0 pb-0">  
                                                            Car Description-<asp:Label ID="Label12" runat="server" Text='<%# Eval("Description") %>' Font-Bold="True" Font-Italic="True"></asp:Label>
                                                            &nbsp;
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-12 mt-2">
                                                            <div class="fa-pull-left ml-2">
                                                                <i class="fas fa-arrows-alt"></i>
                                                                <span >Category</span><br />
                                                                <span class="ml-4"><asp:Label ID="Label17" runat="server" Text='<%# Eval("Category") %>'></asp:Label></span>
                                                            </div>
                                                            <div class="fa-pull-left ml-4">
                                                                <i class="fas fa-car"></i>
                                                                <span >Body Style</span><br />
                                                                <span class="ml-4"><asp:Label ID="Label16" runat="server" Text='<%# Eval("BodyStyle") %>'></asp:Label></span>
                                                            </div>
                                                            <div class="fa-pull-left ml-4">
                                                                <i class="far fa-user"></i>
                                                                <span >Passengers</span><br />
                                                                <span class="ml-4"><asp:Label ID="Label13" runat="server" Text='<%# Eval("Seats") %>'></asp:Label> max</span>
                                                            </div>
                                                            <div class="fa-pull-left ml-4">
                                                                <i class="fas fa-briefcase"></i>
                                                                <span >Bags</span><br />
                                                                <span class="ml-4"><asp:Label ID="Label18" runat="server" Text='<%# Eval("Bags") %>'></asp:Label> max</span>
                                                            </div>
                                                            <div class="fa-pull-left ml-4">
                                                                <i class="fas fa-door-open"></i>
                                                                <span >Doors</span><br />
                                                                <span class="ml-4"><asp:Label ID="Label14" runat="server" Text='<%# Eval("Doors") %>' ></asp:Label> max</span>
                                                            </div>
                                                            <div class="fa-pull-left ml-4">
                                                                <i class="fas fa-temperature-high"></i>
                                                                <span >Air Condition</span><br />
                                                                <span class="ml-4"><asp:Label ID="Label15" runat="server" Text='<%# Eval("AirCon") %>'></asp:Label></span>
                                                            </div>
                                                           
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                                <div class="col-lg-2 d-flex justify-content-center align-items-center">
                                                    <asp:Image CssClass="img-fluid p-0 ml-1" ID="Image1" runat="server" ImageUrl='<%# Eval("CarImage") %>' />  
                                                 </div>           
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-10"></div>
                                                <div class="col-lg-2 float-right">
                                                    <span class="ml-3  p-0"><asp:Label ID="Label19" runat="server" Text='<%# Eval("Cost") %>' Font-Bold="True" Font-Size="Large"></asp:Label>Taka</span>
                                                   <br /><a class="btn btn-primary active text-center mb-3" href="Homepage.aspx">Book Now</a>
                                                </div>
                                            </div>
                                            
                                                    
                                                
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                            </Columns>
                         </asp:GridView>
                         
                     </div>
                  </div>
               </div>
            </div>
        </div>
         <a href="Homepage.aspx"><< Back to Home</a><br><br>
    </div>
</asp:Content>
