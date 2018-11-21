model simulator
  "Block that.simulators a vector of real values with Simulator"
  extends Modelica.Blocks.Interfaces.BlockIcon;

///////////// THE CODE BELOW HAS BEEN AUTOGENERATED //////////////
  parameter String _configurationFileName = "C:\\Users\\DRRC\\Desktop\\fmi-for-power-system\\tests\\004_connect_cyme\\cyme\\jonathan.json2"
    "parameter";
  Modelica.Blocks.Interfaces.RealInput IEEE34NODES_836_KW(start=0.0, unit="kW")
    "input P" annotation(Placement(transformation(extent={{-122,68},{-100,90}})));
  Modelica.Blocks.Interfaces.RealInput IEEE34NODES_836_KVAR(start=0.0, unit="kW")
    "input Q" annotation(Placement(transformation(extent={{-122,48},{-100,70}})));
  Modelica.Blocks.Interfaces.RealOutput voltage_836_Vpu (unit="1")
    "output voltage p.u." annotation(Placement(transformation(extent={{100,70},{120,90}})));
  // Configuration specific parameters coming from
  // the inputs of the Python export tool (SimulatorToFMU.py)
  parameter String patResScri = Modelica.Utilities.Files.loadResource("C:\\Users\\DRRC\\Desktop\\fmi-for-power-system\\tests\\004_connect_cyme\\cyme\\start_server.bat")
    "Path to the script in resource folder";
  // used to generate the FMU
  parameter Boolean _saveToFile (fixed=true) = false "Flag for writing results";

protected
   parameter String runServer = Modelica.Utilities.Files.loadResource("C:\\Users\\DRRC\\Desktop\\fmi-for-power-system\\tests\\004_connect_cyme\\cyme\\run_server.py")
    "Path to the script to run the server";
  SimulatorToFMU.Server.Functions.BaseClasses.ServerObject obj=
  SimulatorToFMU.Server.Functions.BaseClasses.ServerObject(patResScri=patResScri,
    nStrPar=nStrPar,
    nDblPar=nDblPar,
    strParNam=strParNam,
    strParVal=strParVal,
    dblParNam=dblParNam,
    dblParVal=dblParVal);

   parameter Integer nDblPar=0
    "Number of double parameter values to sent to Simulator";
   parameter Integer nStrPar=1
    "Number of string parameter values to sent to Simulator";
  parameter Integer nDblInp(min=1)=2
    "Number of double input values to sent to Simulator";
  parameter Integer nDblOut(min=1)=1
    "Number of double output values to receive from Simulator";

  Real dblInpVal[nDblInp] "Value to be sent to Simulator";

  
  Real uR[nDblInp]={
  IEEE34NODES_836_KW,
  IEEE34NODES_836_KVAR
  }"Variables used to collect values to be sent to Simulator";
  
  Real yR[nDblOut]={
  voltage_836_Vpu
  }"Variables used to collect values received from Simulator";
  
  parameter String dblInpNam[nDblInp]={
  "IEEE34NODES!836!KW",
  "IEEE34NODES!836!KVAR"
  }"Input variable name to be sent to Simulator";
  
  parameter String dblOutNam[nDblOut]={
  "voltage!836!Vpu"
  }"Output variable names to be received from Simulator";
  parameter String dblParNam[nDblPar]
    "Double parameter variable names to be sent to Simulator";
  parameter Real dblParVal[nDblPar]=zeros(nDblPar)
    "Double parameter variable values to be sent to Simulator";

  
  parameter String strParNam[nStrPar]={
  "_configurationFileName"
  }"String parameter variable names to be sent to Simulator";

  
  parameter String strParVal[nStrPar]={
  _configurationFileName
  }"String parameter variable values to be sent to Simulator";


///////////// THE CODE ABOVE HAS BEEN AUTOGENERATED //////////////
  protected

  equation
	// Compute values that will be sent to Simulator
	for _cnt in 1:nDblInp loop
	  dblInpVal[_cnt] = uR[_cnt];
	end for;

	// Simulator data
	yR = SimulatorToFMU.Server.Functions.simulator(
	  modTim=time,
	  nDblInp=nDblInp,
	  dblInpNam=dblInpNam,
	  dblInpVal=dblInpVal,
	  nDblOut=nDblOut,
	  dblOutNam=dblOutNam,
	  resWri=_saveToFile,
	  obj=obj);
end simulator;