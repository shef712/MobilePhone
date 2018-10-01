using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobilePhone
{
    public partial class Default : System.Web.UI.Page
    {
        double TimeInterval = 0;
        int RepeatButtonCount = 0;
        int? PrevKey = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            double CurrTime = DateTime.Now.TimeOfDay.TotalSeconds;
            double PrevTime = Session["PrevTime"] != null ? Convert.ToDouble(Session["PrevTime"]) : -CurrTime;
            TimeInterval = CurrTime - PrevTime;
            Session["PrevTime"] = CurrTime;

            RepeatButtonCount = Session["RepeatButtonCount"] != null ? Convert.ToInt32(Session["RepeatButtonCount"]) : 0;
            PrevKey = (int?)Session["PrevKey"];
        }

        protected void Keypad_Click(object sender, EventArgs e)
        {
            LinkButton Key = (LinkButton)sender;
            int CurrKey = Convert.ToInt32(Key.CommandArgument);
            String[] Letters = Key.CommandName.Split(',');

            if (TimeInterval <= 0.5 && CurrKey == PrevKey)
            {
                RepeatButtonCount = RepeatButtonCount + 1;
                if (RepeatButtonCount >= Letters.Length) { RepeatButtonCount = 0; }
                Session["RepeatButtonCount"] = RepeatButtonCount;

                if (Letters.Length > 0)
                {
                    String CurrText = Textbox1.Text;
                    String Prefix = "";
                    String LastLetter = "";
                    if (CurrText.Length > 0)
                    {
                        Prefix = CurrText.Substring(0, CurrText.Length - 1);
                        LastLetter = CurrText.Substring(CurrText.Length - 1, 1);
                    }
                    else { LastLetter = CurrText; }

                    LastLetter = Letters[RepeatButtonCount];
                    Textbox1.Text = Prefix + LastLetter;
                }
            }
            else
            {
                if (Letters.Length > 0)
                {
                    RepeatButtonCount = 0;
                    Session["RepeatButtonCount"] = RepeatButtonCount;
                    Textbox1.Text += Letters[RepeatButtonCount];
                }
            }
            Session["PrevKey"] = CurrKey;
        }

        protected void Calculate_Click(object sender, EventArgs e)
        {
            LinkButton Calculate_LB = (LinkButton)sender;

        }
    }
}