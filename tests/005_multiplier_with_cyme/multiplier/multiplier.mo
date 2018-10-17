model multiplier
  "Block that.simulators a vector of real values with Simulator"
  extends Modelica.Blocks.Interfaces.BlockIcon;

///////////// THE CODE BELOW HAS BEEN AUTOGENERATED //////////////
  Modelica.Blocks.Interfaces.RealInput x(start=0.0, unit="V")
    "input" annotation(Placement(transformation(extent={{-122,68},{-100,90}})));
  Modelica.Blocks.Interfaces.RealOutput y (unit="1")
    "output" annotation(Placement(transformation(extent={{100,70},{120,90}})));
  // Configuration specific parameters coming from
  // the inputs of the Python export tool (SimulatorToFMU.py)
  parameter String patResScri = Modelica.Utilities.Files.loadResource("C:\\Users\\DRRC\\Desktop\\fmi-for-power-system\\tests\\005_multiplier_with_cyme\\multiplier\\multiplier_wrapper.py")
    "Path to the script in resource folder";
  // used to generate the FMU
  //
  // parameter String _configurationFileName = "dummy.csv"
  //  "Path to the configuration or input file";
  //
   //
  parameter Boolean _saveToFile (fixed=true) = false "Flag for writing results";

protected
  SimulatorToFMU.Python27.Functions.BaseClasses.PythonObject obj=
  SimulatorToFMU.Python27.Functions.BaseClasses.PythonObject(patResScri=patResScri);
  parameter Boolean passMemoryObject = true
    "Set to true if the Python function returns and receives an object, see User's Guide";

   parameter Integer nDblPar=0
    "Number of double parameter values to sent to Simulator";
   parameter Integer nStrPar=0
    "Number of string parameter values to sent to Simulator";
  parameter Integer nDblInp(min=1)=1
    "Number of double input values to sent to Simulator";
  parameter Integer nDblOut(min=1)=1
    "Number of double output values to receive from Simulator";

  Real dblInpVal[nDblInp] "Value to be sent to Simulator";

  
  Real uR[nDblInp]={
  x
  }"Variables used to collect values to be sent to Simulator";
  
  Real yR[nDblOut]={
  y
  }"Variables used to collect values received from Simulator";
  
  parameter String dblInpNam[nDblInp]={
  "x"
  }"Input variable name to be sent to Simulator";
  
  parameter String dblOutNam[nDblOut]={
  "y"
  }"Output variable names to be received from Simulator";
  parameter String dblParNam[nDblPar]
    "Double parameter variable names to be sent to Simulator";
  parameter Real dblParVal[nDblPar]=zeros(nDblPar)
    "Double parameter variable values to be sent to Simulator";

  parameter String strParNam[nStrPar]
    "String parameter variable names to be sent to Simulator";

  parameter String strParVal[nStrPar]
    "String parameter variable values to be sent to Simulator";


///////////// THE CODE ABOVE HAS BEEN AUTOGENERATED //////////////
  protected
    parameter String moduleName="multiplier_wrapper"
      "Name of the Python module that contains the function";
    parameter String functionName="exchange"
      "Name of the Python function";

  equation
	// Compute values that will be sent to Simulator
	for _cnt in 1:nDblInp loop
	  dblInpVal[_cnt] = uR[_cnt];
	end for;

	// Simulator data
	yR = SimulatorToFMU.Python27.Functions.simulator(
	  moduleName=moduleName,
	  functionName=functionName,
	  //conFilNam=_configurationFileName,
    conFilNam="",
    modTim=time,
    nDblInp=nDblInp,
    dblInpNam=dblInpNam,
    dblInpVal=dblInpVal,
    nDblOut=nDblOut,
    dblOutNam=dblOutNam,
    nDblPar=nDblPar,
    dblParNam=dblParNam,
    dblParVal=dblParVal,
    resWri=_saveToFile,
    obj=obj,
    passMemoryObject=passMemoryObject);
end multiplier;