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

        .item {
            margin: 10px;
            background-color: tomato;
            border-radius: 10px;
        }

            .item a.Key {
                text-decoration: none;
                color: white;
                display: inline-block;
                height: 200px;
                width: 200px;
                text-align: center;
            }

                .item a.Key div:nth-child(1) {
                    padding-top: 20px;
                    font-size: 36px;
                }

                .item a.Key div:nth-child(2)  {
                    padding-top: 20px;
                    font-size: 24px;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="item">
                <asp:LinkButton runat="server" ID="One" CssClass="Key">
                    <div>1</div>
                </asp:LinkButton>
            </div>
            <div class="item">
                <asp:LinkButton runat="server" ID="Two" CssClass="Key">
                    <div>2</div>
                    <div>abc</div>
                </asp:LinkButton>
            </div>
            <div class="item">
                <asp:LinkButton runat="server" ID="Three" CssClass="Key">
                    <div>3</div>
                    <div>def</div>
                </asp:LinkButton>
            </div>
        </div>
        <div class="container">
            <div class="item">
                <asp:LinkButton runat="server" ID="Four" CssClass="Key">
                    <div>4</div>
                    <div>ghi</div>
                </asp:LinkButton>
            </div>
            <div class="item">
                <asp:LinkButton runat="server" ID="Five" CssClass="Key">
                    <div>5</div>
                    <div>jkl</div>
                </asp:LinkButton>
            </div>
            <div class="item">
                <asp:LinkButton runat="server" ID="Six" CssClass="Key">
                    <div>6</div>
                    <div>mno</div>
                </asp:LinkButton>
            </div>
        </div>
        <div class="container">
            <div class="item">
                <asp:LinkButton runat="server" ID="Seven" CssClass="Key">
                    <div>7</div>
                    <div>pqrs</div>
                </asp:LinkButton>
            </div>
            <div class="item">
                <asp:LinkButton runat="server" ID="Eight" CssClass="Key">
                    <div>8</div>
                    <div>tuv</div>
                </asp:LinkButton>
            </div>
            <div class="item">
                <asp:LinkButton runat="server" ID="Nine" CssClass="Key">
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
                <asp:LinkButton runat="server" ID="Zero" CssClass="Key">
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
    </form>
</body>
</html>
