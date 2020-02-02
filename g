using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bank
{
    class current : bank_account
    {
       public static double rate = 0.05;
       public current(string Name, double Balance, string Date)
           : base(Name, Balance, Date)
       {
           
       }
       public current()
       {

       }
        public void ADD(double Add_balance)
       {
           calc();
           balance += Add_balance;
       }
        public  void Take(double Take_balance)
        {
            calc();
            balance -= Take_balance;
        }
        private void calc()
        {
            if (duration() >= 1)
            {
                for (int i = 0; i < duration(); i++)
                {
                balance += (balance * rate);
                }
                date = DateTime.Now;
            }
        }
        public override string ToString()
        {
            calc();
            return base.ToString() + "\nRate every mounth is : " + rate + "\n*************************************";
        }
    }
}

00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

namespace Bank
{
    class deposit : bank_account
    {
        private double rate;
        private int pirod;
        public deposit(string Name, double Balance, string Date,double Rate, int Pirod):base(Name,Balance,Date)
        {
            rate = Rate;
            pirod = Pirod;
        }
        public deposit()
        {

        }
        public void calc()
        {
            int tem = duration() / pirod;
            for (int i = 0; i < tem; i++)
            {
                balance += (balance * rate);
            }
            date = DateTime.Now;
        }
        public void Break(double T_balance)
        {
            if (duration() >= pirod) 
            {
                calc();
                balance -= T_balance;
                Console.WriteLine("[ after Take ]\n" + this.ToString());
            }
            else
            {
                Console.WriteLine("you can't do this operation ");
            }
        }
        public override string ToString()
        {
            return base.ToString()+"\nRate Evrey "+pirod+" month is : "+rate+"\n*************************************";
        }
    }
}

0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

namespace Bank
{
    class Program
    {
        static void Main(string[] args)
        {
            current x = new current("owis", 40000,"1/12/2019" );
            Console.WriteLine(x.ToString());

        }
    }
}

000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

namespace Bank
{
    class bank_account 
    {
        string name;
       protected double balance;
       protected DateTime date;
        public bank_account(string Name , double Balance, string Date)
        {
            name = Name;
            balance = Balance;
            date = DateTime.Parse(Date);
        }
        public bank_account()
        {
        }
        public override string ToString()
        {
            return "name : "+name+"\nBalance : "+balance;
        }
        protected int duration()
        {
            return (DateTime.Now - date).Days / 30;
        }

    }
}
