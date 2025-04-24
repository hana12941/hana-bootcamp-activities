import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, ImageBackground, Image, TouchableOpacity } from 'react-native';

export default function App() {

  const handlePress = (buttonName) => {
    console.log(`${buttonName} Pressed!`);
  };

  return (
    <ImageBackground
      source={require('./wow.jpg')} 
      style={styles.container}
    >
      <Image
        source={require('./wow.jpg')} 
        style={styles.image}
      />
      
      <Text style={styles.text}>HELOOOOO!</Text>

      {/* Buttons Section */}
      <View style={styles.buttonContainer}>
        <TouchableOpacity style={styles.button} onPress={() => handlePress('Press Me')}>
          <Text style={styles.buttonText}>Start</Text>
        </TouchableOpacity>
        
        <TouchableOpacity style={styles.button} onPress={() => handlePress('Another Button')}>
          <Text style={styles.buttonText}>Settings</Text>
        </TouchableOpacity>
        
    
      </View>

      <StatusBar style="auto" />
    </ImageBackground>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  image: {
    width: 150,  // Adjusted width for the image (fixed size for better consistency)
    height: 150,  // Adjusted height for the image
    borderRadius: 75,  // Circular shape (half of the width/height)
    marginBottom: 20,
  },
  text: {
    fontSize: 24,  // Adjusted font size for responsiveness
    fontWeight: 'bold',
    color: '#FF6347',
    textAlign: 'center',
    lineHeight: 35,  // Reduced line height to keep it compact
    textShadowColor: '#000',
    textShadowOffset: { width: 1, height: 1 },
    textShadowRadius: 5,
    marginBottom: 30,
  },
  buttonContainer: {
    width: '80%',  // Ensures buttons take 80% of screen width, making it responsive
    marginTop: 20,
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center',
  },
  button: {
    backgroundColor: '#FF6347',  // Button background color
    width: '100%',  // Full width for the button
    padding: 15,
    marginVertical: 10,  // Space between buttons
    borderRadius: 5,
    alignItems: 'center',  // Center button text
  },
  buttonText: {
    color: '#fff',  // Button text color
    fontSize: 18,
    fontWeight: 'bold',
  },
});