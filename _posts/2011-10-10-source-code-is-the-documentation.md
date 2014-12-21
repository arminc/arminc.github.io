---
title: Source Code is the documentation
layout: post
permalink: /2011/10/10/source-code-is-the-documentation/
categories:
  - other
tags:
  - agile
  - agile architecture
  - boy scout rule
  - clean code
  - code
  - SOLID
  - source
  - source code
---
Original post can be found at [It-Eye][1]

In an Agile environment we try to creat “just enough documentation” and “just enough architecture”. To achieve this we need our source code to become a part of the documentation.  
At this point most developers will jump in the air and all others will go “oooh NO”. The reason why we have such reactions is because developers think they don&#8217;t need to do anything and all others think the code is not readable. I must say that in the past the last argument was pretty much true, but all of this has changed or it needs to change fast. <!--more-->

  
Developers need to start creating more clean and readable code. The first reason why they need to do this is because the code gets better and is easier to maintain. The second reason is Developers need to be aware that the source code is part of the documentation, because they are not the only ones that need to be able to read it. But it&#8217;s not only the Developers that need to change, others in the project need to accept that the source code is a part of the documentation as well.

There are enough books, tips and principles to achieve this clean and readable code, some examples [SOLID principles][2], [Clean Code][3], [Boy scout rule][4]. To show what I mean here is an example.

Bad example, we can all conclude that this peace of code is not easy to read.

<pre class="brush: java; title: ; notranslate" title="">@Override
    public void onCreate(Bundle savedInstanceState)
    {
	context = getApplicationContext();

	// TODO: check for incoming intent?
	intentValue = null;
	checkForIntent(getIntent());
	super.onCreate(savedInstanceState);
	properties = PreferenceManager.getDefaultSharedPreferences(Beta_SMS.this);
	// Check if the account is valid, if not open the wizard (should happen only the first time you open the app
	if (!Utils.checkForValidAccount(properties))
	{
	    startActivity(new Intent(this, Wizard.class));
	}

	// Set the view
	Log.d(Const.TAG_MAIN, "Creating the view and the rest of the GUI.");
	super.onCreate(savedInstanceState);

	//allow custom title
	requestWindowFeature(Window.FEATURE_CUSTOM_TITLE);

	setContentView(R.layout.betasms);

	//set custom title
	getWindow().setFeatureInt(Window.FEATURE_CUSTOM_TITLE, R.layout.title);
	txtTitleSaldoValue = (TextView) findViewById(R.id.txtTitleSaldoValue);
	txtTitleSaldo = (TextView) findViewById(R.id.txtTitleSaldo);	

	//show providers
	providers = getResources().getStringArray(R.array.providers);

	//get the rest of the ui components
	to = (AutoCompleteTextView) findViewById(R.id.txtTo);
	txtTextCount = (TextView) findViewById(R.id.txtTextCount);
	txtSmsText = (EditText) findViewById(R.id.txtSmsText);
	send = (Button) findViewById(R.id.btnSend);
	contact = (Button) findViewById(R.id.btnContact);

	// get the balance
	showBalance();

	txtSmsText.addTextChangedListener(new SmsTextCounter(txtTextCount));

	if (intentValue != null)
	{
	    to.setText(intentValue);
	}

	// auto complete contacts, show all phones
	phoneHandler = new PhonesHandler();
	to.setAdapter(phoneHandler.getContactsPhonesListAdapter(getContentResolver(), this));

	// Set the intent for selecting the contact
	intent = new Intent(Intent.ACTION_PICK, ContactsContract.Contacts.CONTENT_URI);

	// When taped it will fire up an intent for showing Contacts,
	// when a contact is selected it will return and fire up
	// onActivityResult function
	contact.setOnClickListener(new View.OnClickListener()
	{
	    public void onClick(View v)
	    {
		Log.d(Const.TAG_MAIN, "Double taped, show contacts");
		startActivityForResult(intent, Const.PICK_CONTACT);
	    }
	});

	// when send clicked
	send.setOnClickListener(new View.OnClickListener()
	{
	    public void onClick(View v)
	    {
		onSend();
	    }
	});

	// set focus on the sms text field
	txtSmsText.requestFocus();
    }
</pre>

Good example, I hope we all agree when I say that this code is easy to read and to follow. 

<pre class="brush: java; title: ; notranslate" title="">@Override
    public void onCreate(Bundle savedInstanceState)
    {
	Log.d(Const.TAG_MAIN, "Starting the application");
	// set context to a helper class
	ApplicationContextHelper.setContext(getApplicationContext());
	super.onCreate(savedInstanceState);
	setBroadcastReceiver();

	loadProperties();
	validateAcount();
	setView();
	assignUiComponentsToVariables();
	showBalance();
	checkIntent(getIntent());
	setListeners();
	// set focus on the sms text field
	txtSmsText.requestFocus();
    }
</pre>

Both the first and the second example do exactly the same but the second one can be understood in seconds where the first one first needs to be interpreted. In the second example I left the “detailed” code out on purpose because it is not about the detailed code. When we talk about documentation we want to know more about the flow and the relations not the details. If done correctly the details should already be tested and can be reviewed by looking at the test cases.

 [1]: http://www.it-eye.nl/2011/10/10/source-code-is-the-documentation/
 [2]: http://en.wikipedia.org/wiki/SOLID_(object-oriented_design)
 [3]: http://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882
 [4]: http://programmer.97things.oreilly.com/wiki/index.php/The_Boy_Scout_Rule