import jp.go.aist.rtm.RTC.Manager;
import jp.go.aist.rtm.RTC.DataFlowComponentBase;
import RTC.ReturnCode_t;
import jp.go.aist.rtm.RTC.port.InPort;
import jp.go.aist.rtm.RTC.util.DataRef;
import RTC.TimedLong;
import RTC.Time;

public class ConsoleOutImpl extends DataFlowComponentBase {
  public ConsoleOutImpl(Manager manager) {
    super(manager);
    m_in_val = new TimedLong();
    m_in_val.tm = new Time();
    m_in = new DataRef<TimedLong>(m_in_val);
    m_inIn = new InPort<TimedLong>("in", m_in);
  }
  protected ReturnCode_t onInitialize() {
    try {
      addInPort("in", m_inIn);
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
    return super.onInitialize();
  }
  @Override protected ReturnCode_t onExecute(int ec_id) {
    if( m_inIn.isNew() ) {
      m_inIn.read();
      print( "Received: " + m_in.v.data + " " );
      print( "TimeStamp: " + m_in.v.tm.sec + "[s] " );
      println( m_in.v.tm.nsec + "[ns]" );
      
    }
    return super.onExecute(ec_id);
  }

  protected TimedLong m_in_val;
  protected DataRef<TimedLong> m_in;
  protected InPort<TimedLong> m_inIn;
};
