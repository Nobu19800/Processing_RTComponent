import jp.go.aist.rtm.RTC.Manager;
import jp.go.aist.rtm.RTC.ModuleInitProc;
import jp.go.aist.rtm.RTC.util.Properties;
import jp.go.aist.rtm.RTC.RTObject_impl;

public class ConsoleInComp implements ModuleInitProc {
  public void myModuleInit(Manager mgr) {
    Properties prop = new Properties(consolein_conf);
    mgr.registerFactory(prop, new ConsoleIn(), new ConsoleIn());
    RTObject_impl comp = mgr.createComponent("ConsoleIn");
  }
}
