import jp.go.aist.rtm.RTC.Manager;
import jp.go.aist.rtm.RTC.ModuleInitProc;
import jp.go.aist.rtm.RTC.util.Properties;
import jp.go.aist.rtm.RTC.RTObject_impl;

public class ConsoleOutComp implements ModuleInitProc {
  public void myModuleInit(Manager mgr) {
    Properties prop = new Properties(consoleout_conf);
    mgr.registerFactory(prop, new ConsoleOut(), new ConsoleOut());
    RTObject_impl comp = mgr.createComponent("ConsoleOut");
  }
}
