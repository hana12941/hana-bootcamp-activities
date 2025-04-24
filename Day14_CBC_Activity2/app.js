import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createStackNavigator} from '@react-navigation/stack';
import Homescreen from './Screens/Homescreen';
import DetailsScreen from './Screens/DetailsScreen';
import RedScreen from './Screens/RedScreen';
import BlueScreen from './Screens/BlueScreen';
import GreenScreen from './Screens/GreenScreen';

const Stack = createStackNavigator();
export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Home">
        <Stack.Screen name="Home" component = {Homescreen}/>
        <Stack.Screen name="Details" component = {DetailsScreen}/>
        <Stack.Screen name="Red" component = {RedScreen}/>
        <Stack.Screen name="Blue" component = {BlueScreen}/>
        <Stack.Screen name="Green" component = {GreenScreen}/>
      </Stack.Navigator>
    </NavigationContainer>
 
  );
}