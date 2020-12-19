using System;
using OpenQA.Selenium.Winium;
using System.IO;
using Newtonsoft.Json;
using AutomationFlying.Infrastructure.Configuration;

namespace AutomationFlying.Infrastructure.Driver
{
    public static class DriverManager
    {
        static DesktopOptions Options{get;set;}
        public static WiniumDriver Driver {get;set;}

        static Configurations Configuration{get;set;}

        public static void SetOptions()
        {
            Options = new DesktopOptions();
            Options.ApplicationPath = Configuration.AppPath;
        }

        public static void SetConfigurations()
        {
            Configuration = JsonConvert.DeserializeObject<Configurations>(File.ReadAllText(Directory.GetCurrentDirectory()+"/Infrastructure/Configuration/configuration.json"));
        }

        public static void SetDriver()
        {
            Driver = new WiniumDriver(Configuration.DriverPath ,Options); 
            Driver.Manage().Timeouts().ImplicitlyWait(GetTimeSpan(Configuration.TimeWait));
        }    
        static TimeSpan GetTimeSpan(int timeInSeconds)
        {
            return TimeSpan.FromSeconds(timeInSeconds);            
        } 
        public static void closeDriver()
        {
            if(Driver!=null)
                Driver.Close();            
        } 
    }
}