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

        String[][] MyLetters = new String[12][];

        protected void Page_Load(object sender, EventArgs e)
        {
            //Initalise data and session variables
            Initialise();
        }

        protected void Initialise()
        {
            //Load Letters
            MyLetters[0] = new String[] { };
            MyLetters[1] = new String[] { "a", "b", "c" };
            MyLetters[2] = new String[] { "d", "e", "f" };
            MyLetters[3] = new String[] { "g", "h", "i" };
            MyLetters[4] = new String[] { "j", "k", "l" };
            MyLetters[5] = new String[] { "m", "n", "o" };
            MyLetters[6] = new String[] { "p", "q", "r", "s" };
            MyLetters[7] = new String[] { "t", "u", "v" };
            MyLetters[8] = new String[] { "w", "x", "y", "z" };
            MyLetters[9] = new String[] { };
            MyLetters[10] = new String[] { " " };
            MyLetters[11] = new String[] { };

            //Load current indexes
            double CurrTime = DateTime.Now.TimeOfDay.TotalSeconds;
            double PrevTime = Session["PrevTime"] != null ? Convert.ToDouble(Session["PrevTime"]) : -CurrTime;
            TimeInterval = CurrTime - PrevTime;
            Session["PrevTime"] = CurrTime;

            RepeatButtonCount = Session["RepeatButtonCount"] != null ? Convert.ToInt32(Session["RepeatButtonCount"]) : 0;
            PrevKey = (int?)Session["PrevKey"];
        }

        //Handle keypad clicks
        protected void Keypad_Click(object sender, EventArgs e)
        {
            LinkButton Key = (LinkButton)sender;
            int CurrKey = Convert.ToInt32(Key.CommandArgument);
            String[] Letters = MyLetters[CurrKey - 1];

            //For consecutive key presses
            if (TimeInterval <= 0.5 && CurrKey == PrevKey)
            {
                RepeatButtonCount = RepeatButtonCount + 1;
                if (RepeatButtonCount >= Letters.Length) { RepeatButtonCount = 0; }
                Session["RepeatButtonCount"] = RepeatButtonCount;

                if (Letters.Length > 0)
                {
                    String CurrText = Input.Text;
                    String Prefix = "";
                    String LastLetter = "";
                    if (CurrText.Length > 0)
                    {
                        Prefix = CurrText.Substring(0, CurrText.Length - 1);
                        LastLetter = CurrText.Substring(CurrText.Length - 1, 1);
                    }
                    else { LastLetter = CurrText; }

                    LastLetter = Letters[RepeatButtonCount];
                    Input.Text = Prefix + LastLetter;
                }
            }
            else //For different key presses
            {
                if (Letters.Length > 0)
                {
                    RepeatButtonCount = 0;
                    Session["RepeatButtonCount"] = RepeatButtonCount;
                    Input.Text += Letters[RepeatButtonCount];
                }
            }
            Session["PrevKey"] = CurrKey;
        }

        protected void Calculate_Click(object sender, EventArgs e)
        {
            LinkButton Calculate_LB = (LinkButton)sender;
            String NumberSequence = "";
            int MinTime = 0;
            int PrevKeyFound = 0;

            String MyInput = Input.Text;
            //Go through each character of the input
            for (int i = 0; i < MyInput.Length; i++)
            {
                String Letter = MyInput[i].ToString();
                for (int j = 0; j < MyLetters.Length; j++)
                {
                    for (int k = 0; k < MyLetters[j].Length; k++)
                    {
                        //Check if we have a matching letter
                        if (MyLetters[j][k] == Letter)
                        {
                            MinTime += MinTime != 0 && PrevKeyFound == j ? 500 : 0;
                            MinTime += 100 * k;
                            PrevKeyFound = j;

                            for (int l = 0; l <= k; l++) { NumberSequence += (j + 1).ToString(); }
                            NumberSequence += "-";
                        }
                    }
                }
            }
            Stats.Text = "Number Seqeunce is " + NumberSequence + " for a minimum time of " + MinTime + "ms";
        }
    }
}