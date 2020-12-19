using Microsoft.VisualStudio.TestTools.UnitTesting;
using AutomationFlying.PageObject;
using AutomationFlying.Infrastructure;

namespace AutomationFlying.Tests
{

    /// <summary>
    /// Contexto: Acessada a aplicação e logado no sistema
    /// </summary>

    [TestClass]
    public class LoginTest:BaseTest
    {
        LoginPage page = new LoginPage();

        public override void Init()
        {
            page.login("John","HP");
        }

        [TestMethod]
        public void DateMustBeLaterThanToday()
        {
            
        }
    }
}