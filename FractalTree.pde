private double fractionLength = .75; 
private int smallestBranch = 10; 
private double branchAngle = .2; 
private int r = 1;
private int g = 255;
private int b = 1; 
public void setup() 
{   
	size(640,480);    
} 
public void draw() 
{   
	branchAngle = branchAngle + 0.005;
	if (r < 255)
		r += 1;
	// else if (r == 255)
	// 	r -= 1;
	else 
		r = 0;
	if (g < 255)
		g+= 1;
	// else if (g == 255)
	// 	g -= 1;
	else 
		g = 0;
	if (b < 255)
		b += 2;
	// else if (b == 255)
	// 	b -= 2;
	else
		b = 0;
	background(0);   
	line(320,480,320,380);
	drawBranches(320, 380, 100, 3*Math.PI/2);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	stroke (r, g, b);
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	if (branchLength >= smallestBranch)
	{
		line (x, y, endX1, endY1);
		line (x, y, endX2, endY2);
		drawBranches(endX1, endY1, branchLength*fractionLength, angle1);
		drawBranches(endX2, endY2, branchLength*fractionLength, angle2);
	}
	else
	{
		line(x, y, endX1, endY1);
		line(x, y, endX2, endY2);
	}

} 
