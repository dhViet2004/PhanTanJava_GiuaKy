package server;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
    public static void main(String[] args) {
        try {
            ServerSocket serverSocket = new ServerSocket(9090);
            System.out.println("Server is ready!!!");
            Socket socket = serverSocket.accept();
            System.out.println(socket.getLocalPort());
            System.out.println(socket.getPort());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
