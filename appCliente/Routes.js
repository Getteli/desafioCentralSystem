import React from 'react';
import { NavigationContainer, createSwitchNavigator } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import * as Expo from 'expo';

import Home from './pages/Home';
import Inicio from './pages/Inicio';
import Login from './pages/Login';
import Photo from './pages/Photo';
import NewsAll from './pages/NewsAll';
import News from './pages/News';

const Stack = createStackNavigator();

export default () => {
  const prefix = Expo.Linking.makeUrl('/');
  return (
    <NavigationContainer uriPrefix={prefix}>
      <Stack.Navigator>
        <Stack.Screen name="Home" component={Home} options={{ headerTitle: "Home", path: 'home' }} />
        <Stack.Screen name="Inicio" component={Inicio} options={{ headerTitle: "Inicio", path: 'Inicio' }} />
        <Stack.Screen name="Login" component={Login} options={{ headerTitle: "Login", path: 'login' }} />
        <Stack.Screen name="Photo" component={Photo} options={{ headerTitle: "Photo", path: 'Photo' }} />
        <Stack.Screen name="NewsAll" component={NewsAll} options={{ headerTitle: "NewsAll", path: 'NewsAll' }} />
        <Stack.Screen name="News" component={News} initialParams={{ id: 0 }} options={{ headerTitle: "News", path: 'News' }} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
