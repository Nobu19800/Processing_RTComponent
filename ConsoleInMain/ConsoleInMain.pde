import jp.go.aist.rtm.RTC.Manager;


Manager manager;

public void setup() {
  String[] args = {"test"};
  manager = Manager.init(args);
  ConsoleInComp init = new ConsoleInComp();
  manager.setModuleInitProc(init);
  manager.activateManager();
  manager.runManager(true);
}


public void draw() {
}
