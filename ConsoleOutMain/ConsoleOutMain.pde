import jp.go.aist.rtm.RTC.Manager;


Manager manager;

public void setup() {
  String[] args = {"test"};
  manager = Manager.init(args);
  ConsoleOutComp init = new ConsoleOutComp();
  manager.setModuleInitProc(init);
  manager.activateManager();
  manager.runManager(true);
}


public void draw() {

}
