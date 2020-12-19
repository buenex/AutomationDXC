using Microsoft.VisualStudio.TestTools.UnitTesting;
using AutomationFlying.Infrastructure.Driver;

namespace AutomationFlying.Infrastructure
{

    public class Assembly
    {
        
    }

    public abstract class BaseTest:Assembly
    {
        [AssemblyInitialize]
        public static void AssemblyInitialize(TestContext context)
        {
           
        }

        [AssemblyCleanup]
        public static void AssemblyCleanup()
        {

        }
        [ClassInitialize]
        public void ClassInitialize(TestContext context)
        {
            ClassInit();
        }

        [ClassCleanup]
        public void ClassCleanup()
        {
            ClassClean();
        }

        [TestInitialize]
        public void Initialize()
        {
            DriverManager.SetConfigurations();
            DriverManager.SetOptions();
            DriverManager.SetDriver();
            Init();
        }        

        [TestCleanup]
        public void Cleanup()
        {
            Clean();
            DriverManager.closeDriver();
        }

        public virtual void Init()
        {

        }

        public virtual void Clean()
        {

        }

        public virtual void ClassInit()
        {

        }

        public virtual void ClassClean()
        {

        }
    }
}


