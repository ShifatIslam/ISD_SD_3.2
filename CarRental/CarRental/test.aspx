<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="CarRental.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });

        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="slogan h5 text-secondary pl-0 mt-5 text-dark font-weight-bold">
            Welcome back!Let us start from where we left off!
        </div>
    </div>
    <div class ="container w-75 mt-5">
        <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalConnectionString %>" SelectCommand="SELECT [UserID], [Carid], [Service], [RentalDays], [GrandTotal], [CarImage], [PickupLocation] FROM [SavedCart] WHERE ([UserID] = @UserID)">
                          <SelectParameters>
                              <asp:SessionParameter Name="UserID" SessionField="username" Type="String" />
                          </SelectParameters>
                          <DeleteParameters>
                            <asp:ControlParameter Name="UserID" ControlId="GridView1"  />
                         </DeleteParameters>
                      </asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered table-hover" ID="GridView1" runat="server" OnRowDeleting="OnRowDeleting" AutoGenerateColumns="False" OnRowDataBound = "OnRowDataBound" DataSourceID="SqlDataSource1" style="margin-right: 0px"   >
                            <Columns>
                                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" >
                                
                                </asp:BoundField>
                                <asp:BoundField DataField="Carid" HeaderText="Carid" SortExpression="Carid" >
                                
                                </asp:BoundField>
                                
                               
                                
                                <asp:BoundField DataField="Service" HeaderText="Service" SortExpression="Service" />
                                <asp:BoundField DataField="RentalDays" HeaderText="RentalDays" SortExpression="RentalDays" />
                                <asp:BoundField DataField="GrandTotal" HeaderText="GrandTotal" SortExpression="GrandTotal" /> 
                                <asp:BoundField DataField="PickupLocation" HeaderText="PickupLocation" SortExpression="PickupLocation" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-7  border-right text-dark " >
                                                    <asp:Image CssClass="img-fluid p-0 ml-1 " ID="carsimg" runat="server"  ImageUrl='<%# Eval("CarImage") %>' />  
                                                </div>
                                                
                                               
                                        <div class="col-md-4 d-flex justify-content-center align-items-center pl-2">
                                            
                                        </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                                
                               
                                
                            </Columns>
                         </asp:GridView>
                         
                     </div>
                  </div>
        <asp:Button runat="server" class="btn btn-outline-danger  font-weight-bolder mb-3 p-2 " OnClick="remove_Click"  Text="Remove"/>
        <div class="row">
            <a href="PaymentgateWay.aspx" class="btn btn-outline-dark btn-lg font-weight-bolder mb-5 p-2">
                Checkout <span class="oi oi-arrow-thick-right"></span>
            </a>
        </div>
    </div>
</asp:Content>
