
import java.io.*;
import java.util.*;
import javamoprt.*;
import java.lang.ref.*;
import org.aspectj.lang.*;

class MonitoringMonitor_Set extends javamoprt.MOPSet {
	protected MonitoringMonitor[] elementData;

	public MonitoringMonitor_Set(){
		this.size = 0;
		this.elementData = new MonitoringMonitor[4];
	}

	public final int size(){
		while(size > 0 && elementData[size-1].MOP_terminated) {
			elementData[--size] = null;
		}
		return size;
	}

	public final boolean add(MOPMonitor e){
		ensureCapacity();
		elementData[size++] = (MonitoringMonitor)e;
		return true;
	}

	public final void endObject(int idnum){
		int numAlive = 0;
		for(int i = 0; i < size; i++){
			MonitoringMonitor monitor = elementData[i];
			if(!monitor.MOP_terminated){
				monitor.endObject(idnum);
			}
			if(!monitor.MOP_terminated){
				elementData[numAlive++] = monitor;
			}
		}
		for(int i = numAlive; i < size; i++){
			elementData[i] = null;
		}
		size = numAlive;
	}

	public final boolean alive(){
		for(int i = 0; i < size; i++){
			MOPMonitor monitor = elementData[i];
			if(!monitor.MOP_terminated){
				return true;
			}
		}
		return false;
	}

	public final void endObjectAndClean(int idnum){
		int size = this.size;
		this.size = 0;
		for(int i = size - 1; i >= 0; i--){
			MOPMonitor monitor = elementData[i];
			if(monitor != null && !monitor.MOP_terminated){
				monitor.endObject(idnum);
			}
			elementData[i] = null;
		}
		elementData = null;
	}

	public final void ensureCapacity() {
		int oldCapacity = elementData.length;
		if (size + 1 > oldCapacity) {
			cleanup();
		}
		if (size + 1 > oldCapacity) {
			MonitoringMonitor[] oldData = elementData;
			int newCapacity = (oldCapacity * 3) / 2 + 1;
			if (newCapacity < size + 1){
				newCapacity = size + 1;
			}
			elementData = Arrays.copyOf(oldData, newCapacity);
		}
	}

	public final void cleanup() {
		int numAlive = 0 ;
		for(int i = 0; i < size; i++){
			MonitoringMonitor monitor = (MonitoringMonitor)elementData[i];
			if(!monitor.MOP_terminated){
				elementData[numAlive] = monitor;
				numAlive++;
			}
		}
		for(int i = numAlive; i < size; i++){
			elementData[i] = null;
		}
		size = numAlive;
	}

	public final void event_open(Bank i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			MonitoringMonitor monitor = (MonitoringMonitor)this.elementData[i_1];
			if(!monitor.MOP_terminated){
				elementData[numAlive] = monitor;
				numAlive++;

				monitor.Prop_1_event_open(i);
				if(monitor.Prop_1_Category_e3) {
					monitor.Prop_1_handler_e3(i);
				}
				if(monitor.Prop_1_Category_e1) {
					monitor.Prop_1_handler_e1(i);
				}
				if(monitor.Prop_1_Category_e2) {
					monitor.Prop_1_handler_e2(i);
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elementData[i_1] = null;
		}
		size = numAlive;
	}

	public final void event_close(Bank i) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			MonitoringMonitor monitor = (MonitoringMonitor)this.elementData[i_1];
			if(!monitor.MOP_terminated){
				elementData[numAlive] = monitor;
				numAlive++;

				monitor.Prop_1_event_close(i);
				if(monitor.Prop_1_Category_e3) {
					monitor.Prop_1_handler_e3(i);
				}
				if(monitor.Prop_1_Category_e1) {
					monitor.Prop_1_handler_e1(i);
				}
				if(monitor.Prop_1_Category_e2) {
					monitor.Prop_1_handler_e2(i);
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elementData[i_1] = null;
		}
		size = numAlive;
	}

	public final void event_withBadDraw(Bank i, int amount) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			MonitoringMonitor monitor = (MonitoringMonitor)this.elementData[i_1];
			if(!monitor.MOP_terminated){
				elementData[numAlive] = monitor;
				numAlive++;

				monitor.Prop_1_event_withBadDraw(i, amount);
				if(monitor.MOP_conditionFail){
					monitor.MOP_conditionFail = false;
				} else {
					if(monitor.Prop_1_Category_e3) {
						monitor.Prop_1_handler_e3(i);
					}
					if(monitor.Prop_1_Category_e1) {
						monitor.Prop_1_handler_e1(i);
					}
					if(monitor.Prop_1_Category_e2) {
						monitor.Prop_1_handler_e2(i);
					}
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elementData[i_1] = null;
		}
		size = numAlive;
	}

	public final void event_withdraw(Bank i, int amount) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			MonitoringMonitor monitor = (MonitoringMonitor)this.elementData[i_1];
			if(!monitor.MOP_terminated){
				elementData[numAlive] = monitor;
				numAlive++;

				monitor.Prop_1_event_withdraw(i, amount);
				if(monitor.MOP_conditionFail){
					monitor.MOP_conditionFail = false;
				} else {
					if(monitor.Prop_1_Category_e3) {
						monitor.Prop_1_handler_e3(i);
					}
					if(monitor.Prop_1_Category_e1) {
						monitor.Prop_1_handler_e1(i);
					}
					if(monitor.Prop_1_Category_e2) {
						monitor.Prop_1_handler_e2(i);
					}
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elementData[i_1] = null;
		}
		size = numAlive;
	}

	public final void event_isApproved(Bank i, Object r) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			MonitoringMonitor monitor = (MonitoringMonitor)this.elementData[i_1];
			if(!monitor.MOP_terminated){
				elementData[numAlive] = monitor;
				numAlive++;

				monitor.Prop_1_event_isApproved(i, r);
				if(monitor.MOP_conditionFail){
					monitor.MOP_conditionFail = false;
				} else {
					if(monitor.Prop_1_Category_e3) {
						monitor.Prop_1_handler_e3(i);
					}
					if(monitor.Prop_1_Category_e1) {
						monitor.Prop_1_handler_e1(i);
					}
					if(monitor.Prop_1_Category_e2) {
						monitor.Prop_1_handler_e2(i);
					}
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elementData[i_1] = null;
		}
		size = numAlive;
	}

	public final void event_isNotApproved(Bank i, Object r) {
		int numAlive = 0 ;
		for(int i_1 = 0; i_1 < this.size; i_1++){
			MonitoringMonitor monitor = (MonitoringMonitor)this.elementData[i_1];
			if(!monitor.MOP_terminated){
				elementData[numAlive] = monitor;
				numAlive++;

				monitor.Prop_1_event_isNotApproved(i, r);
				if(monitor.MOP_conditionFail){
					monitor.MOP_conditionFail = false;
				} else {
					if(monitor.Prop_1_Category_e3) {
						monitor.Prop_1_handler_e3(i);
					}
					if(monitor.Prop_1_Category_e1) {
						monitor.Prop_1_handler_e1(i);
					}
					if(monitor.Prop_1_Category_e2) {
						monitor.Prop_1_handler_e2(i);
					}
				}
			}
		}
		for(int i_1 = numAlive; i_1 < this.size; i_1++){
			this.elementData[i_1] = null;
		}
		size = numAlive;
	}
}

class MonitoringMonitor extends javamoprt.MOPMonitor implements Cloneable, javamoprt.MOPObject {
	public Object clone() {
		try {
			MonitoringMonitor ret = (MonitoringMonitor) super.clone();
			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	boolean MOP_conditionFail = false;
	int Prop_1_state;
	static final int Prop_1_transition_open[] = {2, 5, 5, 2, 5, 5, 6};;
	static final int Prop_1_transition_close[] = {6, 0, 0, 6, 0, 0, 6};;
	static final int Prop_1_transition_withBadDraw[] = {3, 1, 1, 3, 2, 1, 6};;
	static final int Prop_1_transition_withdraw[] = {3, 2, 2, 3, 2, 2, 6};;
	static final int Prop_1_transition_isApproved[] = {3, 2, 4, 3, 4, 2, 6};;
	static final int Prop_1_transition_isNotApproved[] = {3, 6, 6, 3, 6, 6, 6};;

	boolean Prop_1_Category_e3 = false;
	boolean Prop_1_Category_e1 = false;
	boolean Prop_1_Category_e2 = false;

	public MonitoringMonitor () {
		Prop_1_state = 0;

	}

	public final void Prop_1_event_open(Bank i) {
		MOP_lastevent = 0;

		Prop_1_state = Prop_1_transition_open[Prop_1_state];
		Prop_1_Category_e3 = Prop_1_state == 1;
		Prop_1_Category_e1 = Prop_1_state == 3;
		Prop_1_Category_e2 = Prop_1_state == 5;
	}

	public final void Prop_1_event_close(Bank i) {
		MOP_lastevent = 1;

		Prop_1_state = Prop_1_transition_close[Prop_1_state];
		Prop_1_Category_e3 = Prop_1_state == 1;
		Prop_1_Category_e1 = Prop_1_state == 3;
		Prop_1_Category_e2 = Prop_1_state == 5;
	}

	public final void Prop_1_event_withBadDraw(Bank i, int amount) {
		if (!(amount > 1000
		)) {
			MOP_conditionFail = true;
			return;
		}
		MOP_lastevent = 2;

		Prop_1_state = Prop_1_transition_withBadDraw[Prop_1_state];
		Prop_1_Category_e3 = Prop_1_state == 1;
		Prop_1_Category_e1 = Prop_1_state == 3;
		Prop_1_Category_e2 = Prop_1_state == 5;
	}

	public final void Prop_1_event_withdraw(Bank i, int amount) {
		if (!(amount <= 1000
		)) {
			MOP_conditionFail = true;
			return;
		}
		MOP_lastevent = 3;

		Prop_1_state = Prop_1_transition_withdraw[Prop_1_state];
		Prop_1_Category_e3 = Prop_1_state == 1;
		Prop_1_Category_e1 = Prop_1_state == 3;
		Prop_1_Category_e2 = Prop_1_state == 5;
	}

	public final void Prop_1_event_isApproved(Bank i, Object r) {
		if (!(r.equals(Boolean.TRUE)
		)) {
			MOP_conditionFail = true;
			return;
		}
		MOP_lastevent = 4;

		Prop_1_state = Prop_1_transition_isApproved[Prop_1_state];
		Prop_1_Category_e3 = Prop_1_state == 1;
		Prop_1_Category_e1 = Prop_1_state == 3;
		Prop_1_Category_e2 = Prop_1_state == 5;
	}

	public final void Prop_1_event_isNotApproved(Bank i, Object r) {
		if (!(r.equals(Boolean.FALSE)
		)) {
			MOP_conditionFail = true;
			return;
		}
		MOP_lastevent = 5;

		Prop_1_state = Prop_1_transition_isNotApproved[Prop_1_state];
		Prop_1_Category_e3 = Prop_1_state == 1;
		Prop_1_Category_e1 = Prop_1_state == 3;
		Prop_1_Category_e2 = Prop_1_state == 5;
	}

	public final void Prop_1_handler_e3 (Bank i){
		{
			System.out.println("Un retrait de plus de 1 000$ ne peut ?tre effectu? que si l'appel ? isApproved a retourn? true.");
		}

	}

	public final void Prop_1_handler_e1 (Bank i){
		{
			System.out.println("Les op?rations isApproved et withdraw ne peuvent ?tre effectu?es que si un compte est ouvert");
		}

	}

	public final void Prop_1_handler_e2 (Bank i){
		{
			System.out.println("On ne peut ouvrir plus d'un compte simultan?ment.");
		}

	}

	public final void reset() {
		MOP_lastevent = -1;
		Prop_1_state = 0;
		Prop_1_Category_e3 = false;
		Prop_1_Category_e1 = false;
		Prop_1_Category_e2 = false;
	}

	public javamoprt.ref.MOPWeakReference MOPRef_i;

	//alive_parameters_0 = [Bank i]
	public boolean alive_parameters_0 = true;

	public final void endObject(int idnum){
		switch(idnum){
			case 0:
			alive_parameters_0 = false;
			break;
		}
		switch(MOP_lastevent) {
			case -1:
			return;
			case 0:
			//open
			//alive_i
			if(!(alive_parameters_0)){
				MOP_terminated = true;
				return;
			}
			break;

			case 1:
			//close
			//alive_i
			if(!(alive_parameters_0)){
				MOP_terminated = true;
				return;
			}
			break;

			case 2:
			//withBadDraw
			//alive_i
			if(!(alive_parameters_0)){
				MOP_terminated = true;
				return;
			}
			break;

			case 3:
			//withdraw
			//alive_i
			if(!(alive_parameters_0)){
				MOP_terminated = true;
				return;
			}
			break;

			case 4:
			//isApproved
			//alive_i
			if(!(alive_parameters_0)){
				MOP_terminated = true;
				return;
			}
			break;

			case 5:
			//isNotApproved
			//alive_i
			if(!(alive_parameters_0)){
				MOP_terminated = true;
				return;
			}
			break;

		}
		return;
	}

}

public aspect Rules implements javamoprt.MOPObject {
	javamoprt.map.MOPMapManager HasNextMapManager;
	public Rules(){
		HasNextMapManager = new javamoprt.map.MOPMapManager();
		HasNextMapManager.start();
	}

	// Declarations for the Lock
	static Object HasNext_MOPLock = new Object();

	static boolean Monitoring_activated = false;

	// Declarations for Indexing Trees
	static javamoprt.map.MOPBasicRefMapOfMonitor Monitoring_i_Map = new javamoprt.map.MOPBasicRefMapOfMonitor(0);
	static javamoprt.ref.MOPWeakReference Monitoring_i_Map_cachekey_0 = javamoprt.map.MOPBasicRefMapOfMonitor.NULRef;
	static MonitoringMonitor Monitoring_i_Map_cachenode = null;

	// Trees for References
	static javamoprt.map.MOPRefMap HasNext_Bank_RefMap = Monitoring_i_Map;

	pointcut MOP_CommonPointCut() : !within(javamoprt.MOPObject+) && !adviceexecution();
	pointcut Monitoring_open(Bank i) : (call(* Bank.open(..)) && target(i)) && MOP_CommonPointCut();
	after (Bank i) : Monitoring_open(i) {
		Monitoring_activated = true;
		synchronized(HasNext_MOPLock) {
			MonitoringMonitor mainMonitor = null;
			javamoprt.map.MOPMap mainMap = null;
			javamoprt.ref.MOPWeakReference TempRef_i;

			// Cache Retrieval
			if (i == Monitoring_i_Map_cachekey_0.get()) {
				TempRef_i = Monitoring_i_Map_cachekey_0;

				mainMonitor = Monitoring_i_Map_cachenode;
			} else {
				TempRef_i = Monitoring_i_Map.getRef(i);
			}

			if (mainMonitor == null) {
				mainMap = Monitoring_i_Map;
				mainMonitor = (MonitoringMonitor)mainMap.getNode(TempRef_i);

				if (mainMonitor == null) {
					mainMonitor = new MonitoringMonitor();

					mainMonitor.MOPRef_i = TempRef_i;

					Monitoring_i_Map.putNode(TempRef_i, mainMonitor);
				}

				Monitoring_i_Map_cachekey_0 = TempRef_i;
				Monitoring_i_Map_cachenode = mainMonitor;
			}

			mainMonitor.Prop_1_event_open(i);
			if(mainMonitor.Prop_1_Category_e3) {
				mainMonitor.Prop_1_handler_e3(i);
			}
			if(mainMonitor.Prop_1_Category_e1) {
				mainMonitor.Prop_1_handler_e1(i);
			}
			if(mainMonitor.Prop_1_Category_e2) {
				mainMonitor.Prop_1_handler_e2(i);
			}
		}
	}

	pointcut Monitoring_close(Bank i) : (call(* Bank.close(..)) && target(i)) && MOP_CommonPointCut();
	after (Bank i) : Monitoring_close(i) {
		Monitoring_activated = true;
		synchronized(HasNext_MOPLock) {
			MonitoringMonitor mainMonitor = null;
			javamoprt.map.MOPMap mainMap = null;
			javamoprt.ref.MOPWeakReference TempRef_i;

			// Cache Retrieval
			if (i == Monitoring_i_Map_cachekey_0.get()) {
				TempRef_i = Monitoring_i_Map_cachekey_0;

				mainMonitor = Monitoring_i_Map_cachenode;
			} else {
				TempRef_i = Monitoring_i_Map.getRef(i);
			}

			if (mainMonitor == null) {
				mainMap = Monitoring_i_Map;
				mainMonitor = (MonitoringMonitor)mainMap.getNode(TempRef_i);

				if (mainMonitor == null) {
					mainMonitor = new MonitoringMonitor();

					mainMonitor.MOPRef_i = TempRef_i;

					Monitoring_i_Map.putNode(TempRef_i, mainMonitor);
				}

				Monitoring_i_Map_cachekey_0 = TempRef_i;
				Monitoring_i_Map_cachenode = mainMonitor;
			}

			mainMonitor.Prop_1_event_close(i);
			if(mainMonitor.Prop_1_Category_e3) {
				mainMonitor.Prop_1_handler_e3(i);
			}
			if(mainMonitor.Prop_1_Category_e1) {
				mainMonitor.Prop_1_handler_e1(i);
			}
			if(mainMonitor.Prop_1_Category_e2) {
				mainMonitor.Prop_1_handler_e2(i);
			}
		}
	}

	pointcut Monitoring_withBadDraw(Bank i, int amount) : (call(* Bank.withdraw(int, int)) && target(i) && args(*, amount)) && MOP_CommonPointCut();
	before (Bank i, int amount) : Monitoring_withBadDraw(i, amount) {
		Monitoring_activated = true;
		synchronized(HasNext_MOPLock) {
			//Monitoring_withdraw
			{
				MonitoringMonitor mainMonitor = null;
				javamoprt.map.MOPMap mainMap = null;
				javamoprt.ref.MOPWeakReference TempRef_i;

				// Cache Retrieval
				if (i == Monitoring_i_Map_cachekey_0.get()) {
					TempRef_i = Monitoring_i_Map_cachekey_0;

					mainMonitor = Monitoring_i_Map_cachenode;
				} else {
					TempRef_i = Monitoring_i_Map.getRef(i);
				}

				if (mainMonitor == null) {
					mainMap = Monitoring_i_Map;
					mainMonitor = (MonitoringMonitor)mainMap.getNode(TempRef_i);

					if (mainMonitor == null) {
						mainMonitor = new MonitoringMonitor();

						mainMonitor.MOPRef_i = TempRef_i;

						Monitoring_i_Map.putNode(TempRef_i, mainMonitor);
					}

					Monitoring_i_Map_cachekey_0 = TempRef_i;
					Monitoring_i_Map_cachenode = mainMonitor;
				}

				mainMonitor.Prop_1_event_withdraw(i, amount);
				if(mainMonitor.MOP_conditionFail){
					mainMonitor.MOP_conditionFail = false;
				} else {
					if(mainMonitor.Prop_1_Category_e3) {
						mainMonitor.Prop_1_handler_e3(i);
					}
					if(mainMonitor.Prop_1_Category_e1) {
						mainMonitor.Prop_1_handler_e1(i);
					}
					if(mainMonitor.Prop_1_Category_e2) {
						mainMonitor.Prop_1_handler_e2(i);
					}
				}
			}
			//Monitoring_withBadDraw
			{
				MonitoringMonitor mainMonitor = null;
				javamoprt.map.MOPMap mainMap = null;
				javamoprt.ref.MOPWeakReference TempRef_i;

				// Cache Retrieval
				if (i == Monitoring_i_Map_cachekey_0.get()) {
					TempRef_i = Monitoring_i_Map_cachekey_0;

					mainMonitor = Monitoring_i_Map_cachenode;
				} else {
					TempRef_i = Monitoring_i_Map.getRef(i);
				}

				if (mainMonitor == null) {
					mainMap = Monitoring_i_Map;
					mainMonitor = (MonitoringMonitor)mainMap.getNode(TempRef_i);

					if (mainMonitor == null) {
						mainMonitor = new MonitoringMonitor();

						mainMonitor.MOPRef_i = TempRef_i;

						Monitoring_i_Map.putNode(TempRef_i, mainMonitor);
					}

					Monitoring_i_Map_cachekey_0 = TempRef_i;
					Monitoring_i_Map_cachenode = mainMonitor;
				}

				mainMonitor.Prop_1_event_withBadDraw(i, amount);
				if(mainMonitor.MOP_conditionFail){
					mainMonitor.MOP_conditionFail = false;
				} else {
					if(mainMonitor.Prop_1_Category_e3) {
						mainMonitor.Prop_1_handler_e3(i);
					}
					if(mainMonitor.Prop_1_Category_e1) {
						mainMonitor.Prop_1_handler_e1(i);
					}
					if(mainMonitor.Prop_1_Category_e2) {
						mainMonitor.Prop_1_handler_e2(i);
					}
				}
			}
		}
	}

	pointcut Monitoring_isApproved(Bank i) : (call(* Bank.isApproved(int, int)) && target(i)) && MOP_CommonPointCut();
	after (Bank i) returning (Object r) : Monitoring_isApproved(i) {
		Monitoring_activated = true;
		synchronized(HasNext_MOPLock) {
			//Monitoring_isApproved
			{
				MonitoringMonitor mainMonitor = null;
				javamoprt.map.MOPMap mainMap = null;
				javamoprt.ref.MOPWeakReference TempRef_i;

				// Cache Retrieval
				if (i == Monitoring_i_Map_cachekey_0.get()) {
					TempRef_i = Monitoring_i_Map_cachekey_0;

					mainMonitor = Monitoring_i_Map_cachenode;
				} else {
					TempRef_i = Monitoring_i_Map.getRef(i);
				}

				if (mainMonitor == null) {
					mainMap = Monitoring_i_Map;
					mainMonitor = (MonitoringMonitor)mainMap.getNode(TempRef_i);

					if (mainMonitor == null) {
						mainMonitor = new MonitoringMonitor();

						mainMonitor.MOPRef_i = TempRef_i;

						Monitoring_i_Map.putNode(TempRef_i, mainMonitor);
					}

					Monitoring_i_Map_cachekey_0 = TempRef_i;
					Monitoring_i_Map_cachenode = mainMonitor;
				}

				mainMonitor.Prop_1_event_isApproved(i, r);
				if(mainMonitor.MOP_conditionFail){
					mainMonitor.MOP_conditionFail = false;
				} else {
					if(mainMonitor.Prop_1_Category_e3) {
						mainMonitor.Prop_1_handler_e3(i);
					}
					if(mainMonitor.Prop_1_Category_e1) {
						mainMonitor.Prop_1_handler_e1(i);
					}
					if(mainMonitor.Prop_1_Category_e2) {
						mainMonitor.Prop_1_handler_e2(i);
					}
				}
			}
			//Monitoring_isNotApproved
			{
				MonitoringMonitor mainMonitor = null;
				javamoprt.map.MOPMap mainMap = null;
				javamoprt.ref.MOPWeakReference TempRef_i;

				// Cache Retrieval
				if (i == Monitoring_i_Map_cachekey_0.get()) {
					TempRef_i = Monitoring_i_Map_cachekey_0;

					mainMonitor = Monitoring_i_Map_cachenode;
				} else {
					TempRef_i = Monitoring_i_Map.getRef(i);
				}

				if (mainMonitor == null) {
					mainMap = Monitoring_i_Map;
					mainMonitor = (MonitoringMonitor)mainMap.getNode(TempRef_i);

					if (mainMonitor == null) {
						mainMonitor = new MonitoringMonitor();

						mainMonitor.MOPRef_i = TempRef_i;

						Monitoring_i_Map.putNode(TempRef_i, mainMonitor);
					}

					Monitoring_i_Map_cachekey_0 = TempRef_i;
					Monitoring_i_Map_cachenode = mainMonitor;
				}

				mainMonitor.Prop_1_event_isNotApproved(i, r);
				if(mainMonitor.MOP_conditionFail){
					mainMonitor.MOP_conditionFail = false;
				} else {
					if(mainMonitor.Prop_1_Category_e3) {
						mainMonitor.Prop_1_handler_e3(i);
					}
					if(mainMonitor.Prop_1_Category_e1) {
						mainMonitor.Prop_1_handler_e1(i);
					}
					if(mainMonitor.Prop_1_Category_e2) {
						mainMonitor.Prop_1_handler_e2(i);
					}
				}
			}
		}
	}

}
