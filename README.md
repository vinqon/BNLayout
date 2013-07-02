### BNLayout

####Introduction
BNLayout a experimental project which attempts to find out a better way for layout problem for ios programming.

####Feature
compared with the tranditional layout system, BNLayout help you build the UI layout the more flexibly and more convenicent.

#####convenicet
BNLayout use a new struct to specify the position and size of the UIView:

	struct BNLayout {
    	UIEdgeInsets edge;
    	CGSize  size;
	};
	typedef struct BNLayout BNLayout;

As you see above, you can set the top/left/bottom/right to position the view.
	
	BNLayoutMake(10, 10, 10, 10, 300, 460)


#####flexiability
Also, BNLayout induct a new keywords: AUTO, which means is some certain position or size are flexible, for example, we want to create a UIView has a 10px margin bewteen the superview's bounds and its size is resizable:

	BNLayoutMake(10, 10, 10, 10, AUTO, AUTO)
	


