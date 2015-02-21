package Parser;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;

import java.io.File;
import java.util.ArrayList;

import Events.*;

public class ReadXML {

    public static void main(String argv[]) {

            NodeList nList = getNodeList("Log.xml");

            ArrayList listeEvents = new ArrayList();

            for (int temp = 0; temp < nList.getLength(); temp++) {

                Node nNode = nList.item(temp);

                if (nNode.getNodeType() == Node.ELEMENT_NODE) {

                    Element eElement = (Element) nNode;

                   // System.out.println("time : " + eElement.getElementsByTagName("time").item(0).getTextContent());

                   // NodeList telephones = eElement.getElementsByTagName("login");
                    // System.out.println(nNode.getChildNodes().item(3).getNodeName());

                    String eventType = nNode.getChildNodes().item(3).getNodeName();
                    if (eventType.equals("login")) {
                       /* int nbTelephonesElements = telephones.getLength();

                        //for (int j = 0; j < nbTelephonesElements; j++) {

                        //  final Element telephone = (Element) telephones.item(j);

                        //Affichage du téléphone
                        System.out.println("password: " + eElement.getElementsByTagName("password").item(0).getTextContent());
                        System.out.println("user: " + eElement.getElementsByTagName("user").item(0).getTextContent());
                        //  }*/

                        listeEvents.add(new Login(Integer.parseInt(eElement.getElementsByTagName("time").item(0).getTextContent()),
                                eElement.getElementsByTagName("user").item(0).getTextContent(),
                                eElement.getElementsByTagName("password").item(0).getTextContent()));

                    } else if (eventType.equals("write")) {
                        listeEvents.add(new Write(Integer.parseInt(eElement.getElementsByTagName("time").item(0).getTextContent()),
                                eElement.getElementsByTagName("user").item(0).getTextContent(),
                                eElement.getElementsByTagName("application").item(0).getTextContent(),
                                eElement.getElementsByTagName("name").item(0).getTextContent()));
                    } else if (eventType.equals("launch")) {
                        listeEvents.add( new Launch(Integer.parseInt(eElement.getElementsByTagName("time").item(0).getTextContent()),
                                eElement.getElementsByTagName("user").item(0).getTextContent(),
                                eElement.getElementsByTagName("application").item(0).getTextContent()));
                    } else if (eventType.equals("click")) {
                        listeEvents.add(new Click(Integer.parseInt(eElement.getElementsByTagName("time").item(0).getTextContent()),
                                eElement.getElementsByTagName("user").item(0).getTextContent(),
                                eElement.getElementsByTagName("application").item(0).getTextContent(),
                                Integer.parseInt(eElement.getElementsByTagName("x").item(0).getTextContent()),
                                Integer.parseInt(eElement.getElementsByTagName("y").item(0).getTextContent())));
                    } else { //login-success, login-failure, logout
                        listeEvents.add(new EventNode(Integer.parseInt(eElement.getElementsByTagName("time").item(0).getTextContent()),
                                eventType,
                                eElement.getElementsByTagName("user").item(0).getTextContent()));
                    }

                }
                System.out.println(" "+ ((EventNode)listeEvents.get(listeEvents.size()-1)).getTime());
                System.out.println();
            }
    }

    /**
     * lit le xml et donne les 
     * @param fichier
     * @return
     */
    private static NodeList getNodeList(String fichier) {

        NodeList nList = new NodeList() {
            @Override
            public Node item(int i) {
                return null;
            }

            @Override
            public int getLength() {
                return 0;
            }

        };
        try {
            File fXmlFile = new File(fichier);
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(fXmlFile);

            //optional, but recommended
            //read this - http://stackoverflow.com/questions/13786607/normalization-in-dom-parsing-with-java-how-does-it-work
            doc.getDocumentElement().normalize();

            System.out.println("Root element :" + doc.getDocumentElement().getNodeName() + "\n");

            nList = doc.getElementsByTagName("event");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return nList;
    }
}