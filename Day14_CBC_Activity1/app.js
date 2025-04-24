import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createStackNavigator} from '@react-navigation/stack';
import Homescreen from './Screens/Homescreen';
import DetailsScreen from './Screens/DetailsScreen';

const Stack = createStackNavigator();
export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Home">
        <Stack.Screen name="Home" component = {Homescreen}/>
        <Stack.Screen name="Details" component = {DetailsScreen}/>
      </Stack.Navigator>
    </NavigationContainer>
 
  );
}s