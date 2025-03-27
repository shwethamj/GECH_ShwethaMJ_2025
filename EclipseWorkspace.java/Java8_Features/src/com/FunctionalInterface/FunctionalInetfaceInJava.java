package com.FunctionalInterface;

@FunctionalInterface // by using this anootation we can only create only one function,
// but if we remove it we can add multiple function

interface Inteface1{
	public void display();
	//public void newone(); if we add more its shows the error
}

class Display implements Inteface1{

	@Override
	public void display() {
		// TODO Auto-generated method stub
		
	}
	
	
}

public class FunctionalInetfaceInJava {

	public static void main(String[] args) {
		
		Display display = new Display();
		display.display();
		
	}

}
