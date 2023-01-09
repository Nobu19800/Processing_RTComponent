import jp.go.aist.rtm.RTC.Manager;
import jp.go.aist.rtm.RTC.RTObject_impl;
import jp.go.aist.rtm.RTC.RtcDeleteFunc;
import jp.go.aist.rtm.RTC.RtcNewFunc;
import jp.go.aist.rtm.RTC.RegisterModuleFunc;

public String[] consoleout_conf = {
            "implementation_id", "ConsoleOut",
            "type_name",         "ConsoleOut",
            "description",       "Console output component",
            "version",           "1.0",
            "vendor",            "Noriaki Ando, AIST",
            "category",          "example",
            "activity_type",     "DataFlowComponent",
            "max_instance",      "10",
            "language",          "Java",
            "lang_type",         "compile",
            ""
};

public class ConsoleOut implements RtcNewFunc, RtcDeleteFunc, RegisterModuleFunc {

  public RTObject_impl createRtc(Manager mgr) {
    return new ConsoleOutImpl(mgr);
  }
  public void deleteRtc(RTObject_impl rtcBase) {
    rtcBase = null;
  }
  public void registerModule() {
    Properties prop = new Properties();
    final Manager manager = Manager.instance();
    manager.registerFactory(prop, new ConsoleOut(), new ConsoleOut());
  }
}
