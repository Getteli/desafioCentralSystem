import React, { useEffect, useState } from 'react';
import { Alert, StyleSheet, Text, View, TouchableOpacity, Image, TextInput, ScrollView } from 'react-native';
import * as Linking from 'expo-linking';
import { useNavigation } from '@react-navigation/native';
import axios from 'axios';
import AuthService from './../services/AuthService';
import CookieService from "./../services/CookieService";

function Login() {
  // mapear/ler os inputs
  const [email, setEmail] = useState('');
  // button
  const navigation = useNavigation();

  useEffect(() => {
    // verifica se ta logado
    if (CookieService.get("email")) {
      alert("Você já está logado");
      // limpa e volta a rota
      navigation.reset({
          index: 0,
          routes: [{ name: 'Inicio' }],
      });
    }
  }, []);

  function handleEmailChange(email){ setEmail(email); }

  async function handleLoginApi(){
    // tive problemas com o deep link LOCALMENTE, estou passando o email do usuario para salvar no banco junto com o access token
    if(!email){
      alert("Digite o seu email para se conectar com a API");
    }else{
      const postData = new URLSearchParams({
        email: email,
      });
      const response = await AuthService.doUserLogin(postData.toString());

      if (response) {
        // abra o link para fazer login pela API
        Linking.openURL(response);
      } else {
        alert("Erro ao se conectar com o Servidor da API");
      }
    }
  }

  async function handleButtonPress(){
    if(!email){
      alert("Digite o seu email para fazer login.");
    }else{
      const postData = new URLSearchParams({
        email: email,
      });

      const response = await AuthService.loginUserApp(postData.toString());
      if (response) {
        // salva o email
        navigation.navigate('Inicio');
      } else {
        alert("Verifique seu email digitado e tente novamente");
      }
    }
  }

  return (
    <>
      <ScrollView>
        <View style={styles.container}>
          <Text>Faça login</Text>
          <Text>Poderia colocar um botao de registrar e o campo de senha, mas estou fazendo apenas o teste de login direto pela API</Text>
        </View>
        <View style={styles.inputContainer}>
          <TextInput style={styles.input} placeholder="seuemail@provedor.com" onChangeText={handleEmailChange} />

          <TouchableOpacity style={styles.buttonSend} onPress={handleButtonPress}>
            <Text style={styles.textButton}>Login</Text>
          </TouchableOpacity>

          <TouchableOpacity style={styles.buttonSend} onPress={handleLoginApi}>
            <Text style={styles.textButton}>Conectar via API</Text>
          </TouchableOpacity>

          <TouchableOpacity style={styles.button} onPress={() => navigation.goBack()}>
            <Text style={styles.textButton}>Voltar</Text>
          </TouchableOpacity>
        </View>
      </ScrollView>
    </>
  );
}

const styles = StyleSheet.create({
    inputContainer: {
        margin: 20,
        alignItems: 'stretch',
        justifyContent: 'center'
    },
    container: {
      alignItems: 'center',
      justifyContent: 'center',
    },
    topImage: {
        margin: 20,
    },
    title: {
        fontSize: 20,
    },
    input: {
        marginTop: 10,
        height: 60,
        backgroundColor: '#fff',
        borderRadius: 10,
        paddingHorizontal: 24,
        fontSize: 16,
        alignItems: 'stretch',
    },
    buttonSend: {
        marginTop: 10,
        height: 60,
        backgroundColor: 'green',
        borderRadius: 10,
        paddingHorizontal: 24,
        fontSize: 16,
        alignItems: 'center',
        justifyContent: 'center',
    },
    textButton: {
        color: '#fff',
        fontWeight: 'bold',
    },
    button:{
      marginTop: 20,
      alignItems: 'center',
      backgroundColor: '#0000ff',
      padding: 10,
    },
});

export default Login;
