/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.codigo_romano;

import java.util.Scanner;

public class Codigo_Romano {
    public static String decimalARomano(int numero) { // vector - biblioteca
        int[][] valoresSimbolos = { //valores
            {1000, 'M'}, {900, 'C', 'M'}, {500, 'D'}, {400, 'C', 'D'},
            {100, 'C'}, {90, 'X', 'C'}, {50, 'L'}, {40, 'X', 'L'},
            {10, 'X'}, {9, 'I', 'X'}, {5, 'V'}, {4, 'I', 'V'}, {1, 'I'}
        };
        StringBuilder romano = new StringBuilder(); //lista vacia para resultado (almacen)
        int[] valores = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
        String[] simbolos = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};

        for (int i = 0; i < valores.length; i++) { 
            while (numero >= valores[i]) {
                romano.append(simbolos[i]);
                numero -= valores[i];
            }
        }
        return romano.toString();
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int numeroDecimal;
        do {
            System.out.print("Ingresa un número decimal: ");
            numeroDecimal = sc.nextInt();
            if (numeroDecimal < 1 || numeroDecimal > 3999) { //numero mayor a 3999
                System.out.println("Por favor ingresa un número entre 1 y 3999.");
            }
        } while (numeroDecimal < 1 || numeroDecimal > 3999);

        String numeroRomano = decimalARomano(numeroDecimal);
        System.out.println("El número " + numeroDecimal + " en romano es: " + numeroRomano);
    }
}
