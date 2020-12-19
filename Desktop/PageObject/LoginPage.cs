using static AutomationFlying.Infrastructure.BasePage;
using OpenQA.Selenium;

namespace AutomationFlying.PageObject
{
    public class LoginPage
    {
        void insertUsername(string username)
        {
            FindElement(By.Id("15")).SendKeys(username);
        }

        void insertPassword(string password)
        {
            FindElement(By.Id("15")).SendKeys(password);
        }

        void clickOk()
        {
            FindElement(By.Id("okButton"));
        }

        public void login(string username,string password)
        {
            insertUsername(username);
            insertPassword(password);
            clickOk();
        }
    }
}