import jp.go.aist.rtm.RTC.Manager;
import jp.go.aist.rtm.RTC.DataFlowComponentBase;
import RTC.ReturnCode_t;
import jp.go.aist.rtm.RTC.port.OutPort;
import jp.go.aist.rtm.RTC.util.DataRef;
import RTC.TimedLong;


public class ConsoleInImpl extends DataFlowComponentBase {
  public ConsoleInImpl(Manager manager) {
    super(manager);
    m_out_val = new TimedLong(new RTC.Time(0, 0), 0);
    m_out = new DataRef<TimedLong>(m_out_val);
    
    m_outOut = new OutPort<TimedLong>("out", m_out);
  }
  protected ReturnCode_t onInitialize() {
    try {
      addOutPort("out", m_outOut);
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
    return super.onInitialize();
  }
  @Override protected ReturnCode_t onExecute(int ec_id) {
    m_out_val.data = 10;
    m_outOut.setTimestamp(m_out_val);
    m_outOut.write();
    return super.onExecute(ec_id);
  }

  protected TimedLong m_out_val;
  protected DataRef<TimedLong> m_out;
  protected OutPort<TimedLong> m_outOut;
};
