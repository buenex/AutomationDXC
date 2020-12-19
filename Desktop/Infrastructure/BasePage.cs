using OpenQA.Selenium;
using AutomationFlying.Infrastructure.Driver;

namespace AutomationFlying.Infrastructure
{
    public static class BasePage
    {
        public static IWebElement FindElement(By selector)
        {
            return DriverManager.Driver.FindElement(selector);
        } 
    }
}