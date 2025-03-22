package client;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.Scanner;

public class Client {
    public static void main(String[] args) throws IOException {
        try(Socket socket = new Socket("ubuntu-VMware-Virtual-Platform", 9090);
            DataOutputStream out = new DataOutputStream(socket.getOutputStream());
            DataInputStream in = new DataInputStream(socket.getInputStream());
            Scanner scanner = new Scanner(System.in);

        ){
            while (true) {
                System.out.print("Enter your messege: ");
                String messege = scanner.nextLine();
                out.writeUTF(messege);
                out.flush();

                messege = in.readUTF();
                System.out.println("Server: " + messege);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
