<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MobilePhone.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .container {
            display: flex;
            justify-content: center;
            color: whitesmoke;
            font-family: Roboto;
            font-weight: bold;
        }

            .container #Textbox1 {
                width: 600px;
                height: 40px;
                border: 5px solid tomato;
                border-radius: 10px;
                font-size: 26px;
                text-align: right;
                padding: 0px 15px;
                margin-bottom: 10px;
            }

        .item {
            margin: 10px;
        }

            .item a.Key {
                background-color: tomato;
                border-radius: 10px;
                text-decoration: none;
                color: white;
                display: inline-block;
                height: 170px;
                width: 200px;
                text-align: center;
            }

                .item a.Key div:nth-child(1) {
                    padding-top: 35px;
                    font-size: 36px;
                }

                .item a.Key div:nth-child(2) {
                    padding-top: 20px;
                    font-size: 24px;
                }

            .item a#Calculate {
                background-color: #00cccc;
                border-radius: 10px;
                text-decoration: none;
                color: white;
                display: inline-block;
                height: 60px;
                width: 635px;
                text-align: center;
                padding-top: 20px;
                font-size: 32px;
                font-weight:bold;
            }

        .tooltip {
            position: relative;
            display: inline-block;
            border-bottom: 1px dotted black;
        }

            .tooltip .tooltiptext {
                visibility: hidden;
                width: 400px;
                background-color: black;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                padding: 5px 0;
                position: absolute;
                z-index: 1;
                bottom: 100%;
                left: 18%;
            }

                .tooltip .tooltiptext::after {
                    content: "";
                    position: absolute;
                    top: 100%;
                    left: 50%;
                    margin-left: -5px;
                    border-width: 5px;
                    border-style: solid;
                    border-color: black transparent transparent transparent;
                }

            .tooltip:hover .tooltiptext {
                visibility: visible;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>

        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
            <ContentTemplate>
                <div class="container">
                    <div class="item">
                        <asp:LinkButton runat="server" ID="One" CommandArgument="1" CssClass="Key">
                            <div>1</div>
                        </asp:LinkButton>
                    </div>
                    <div class="item">
                        <asp:LinkButton runat="server" ID="Two" CssClass="Key" CommandArgument="2" CommandName="a,b,c" OnClick="Keypad_Click">
                            <div>2</div>
                            <div>abc</div>
                        </asp:LinkButton>
                    </div>
                    <div class="item">
                        <asp:LinkButton runat="server" ID="Three" CssClass="Key" CommandArgument="3" CommandName="d,e,f" OnClick="Keypad_Click">
                            <div>3</div>
                            <div>def</div>
                        </asp:LinkButton>
                    </div>
                </div>
                <div class="container">
                    <div class="item">
                        <asp:LinkButton runat="server" ID="Four" CssClass="Key" CommandArgument="4" CommandName="g,h,i" OnClick="Keypad_Click">
                            <div>4</div>
                            <div>ghi</div>
                        </asp:LinkButton>
                    </div>
                    <div class="item">
                        <asp:LinkButton runat="server" ID="Five" CssClass="Key" CommandArgument="5" CommandName="j,k,l" OnClick="Keypad_Click">
                            <div>5</div>
                            <div>jkl</div>
                        </asp:LinkButton>
                    </div>
                    <div class="item">
                        <asp:LinkButton runat="server" ID="Six" CssClass="Key" CommandArgument="6" CommandName="m,n,o" OnClick="Keypad_Click">
                            <div>6</div>
                            <div>mno</div>
                        </asp:LinkButton>
                    </div>
                </div>
                <div class="container">
                    <div class="item">
                        <asp:LinkButton runat="server" ID="Seven" CssClass="Key" CommandArgument="7" CommandName="p,q,r,s" OnClick="Keypad_Click">
                            <div>7</div>
                            <div>pqrs</div>
                        </asp:LinkButton>
                    </div>
                    <div class="item">
                        <asp:LinkButton runat="server" ID="Eight" CssClass="Key" CommandArgument="8" CommandName="t,u,v" OnClick="Keypad_Click">
                            <div>8</div>
                            <div>tuv</div>
                        </asp:LinkButton>
                    </div>
                    <div class="item">
                        <asp:LinkButton runat="server" ID="Nine" CssClass="Key" CommandArgument="9" CommandName="w,x,y,z" OnClick="Keypad_Click">
                            <div>9</div>
                            <div>xyz</div>
                        </asp:LinkButton>
                    </div>
                </div>
                <div class="container">
                    <div class="item">
                        <asp:LinkButton runat="server" ID="Star" CssClass="Key">
                            <div>*</div>
                        </asp:LinkButton>
                    </div>
                    <div class="item">
                        <asp:LinkButton runat="server" ID="Zero" CssClass="Key" CommandArgument="0" CommandName=" " OnClick="Keypad_Click">
                            <div>0</div>
                            <div>SPACE</div>
                        </asp:LinkButton>
                    </div>
                    <div class="item">
                        <asp:LinkButton runat="server" ID="Hash" CssClass="Key">
                            <div>#</div>
                        </asp:LinkButton>
                    </div>
                </div>
                <div class="container">
                    <asp:TextBox runat="server" ID="Textbox1"></asp:TextBox>
                </div>
                <div class="container">
                    <div class="item">
                        <div class="tooltip">
                            <asp:LinkButton runat="server" ID="Calculate" OnClick="Calculate_Click">
                                <div>CALCULATE</div>
                            </asp:LinkButton>
                            <span class="tooltiptext">Enter to calculate minimum time required for above input string and sequence of keys associated!</span>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
