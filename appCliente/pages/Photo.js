import { StatusBar } from 'expo-status-bar';
import React, { useEffect, useState, useRef } from 'react';
import { useNavigation, StackActions, NavigationActions } from '@react-navigation/native';
import { StyleSheet, Text, View, TouchableOpacity } from 'react-native';
import CookieService from "./../services/CookieService";
import axios from 'axios';
import * as Linking from 'expo-linking';

// importa a camera
import { Camera } from 'expo-camera';
import * as FileSystem from 'expo-file-system';
import Constants from 'expo-constants';
import * as ImagePicker from 'expo-image-picker';

function Photo() {

  // button
  const navigation = useNavigation();
  const cameraReferencia = useRef(null);
  const [hasPermission, setHasPermission] = useState(null);
  const [type, setType] = useState(Camera.Constants.Type.back);
  const [capturedPhoto, setCapturePhoto] = useState(null);

  useEffect(() => {
    // verifica se ta logado
    if (!CookieService.get("email")) {
      alert("faça login para usar o aplicativo.");
      // limpa
      CookieService.remove("email");
      CookieService.remove("access_token");
      // limpa e volta a rota
      navigation.reset({
          index: 0,
          routes: [{ name: 'Home' }],
      });
    }
  }, []);

  // verifica e pede permissao de camera
  useEffect(() => {
    (async () => {
      const { status } = await Camera.requestPermissionsAsync();
      setHasPermission(status === 'granted');
    })();
  }, []);

  async function takePicture() {
    if (cameraReferencia) {
      // foto com dados
      const data = await cameraReferencia.current.takePictureAsync();
      // foto em base64
      const database64 = await cameraReferencia.current.takePictureAsync({base64: true});

      // se tiver vazio retorna
      if (!data.uri) {
        return;
      }

      // prepara os dados
      let localUri = data.uri;
      let localUri64 = database64.base64;
      let filename = localUri.split('/').pop();
      let type = filename.split('.')[1];

      // estou passando o base64 image pois o formData nao estava indo
      // sobe para o servidor a localizacao
      // ALTERE o host para o ip da maquina, porta 8000 roda o servidor da API
      await axios.post('http://192.168.1.40:8000/api/photo/post', {
        data: localUri64,
        name: filename,
        type: type
      },{
        "headers": {
          "Authorization": "Bearer " + CookieService.get("access_token"),
          "content-type": "application/json",
        },
      })
      .then(function(response) {
        console.log(response.data);
      })
      .catch(function(error) {
        console.log(error);
      });

    }
  }

  if (hasPermission === null) {
    return <View />;
  }
  if (hasPermission === false) {
    return <View />;
  }

  return (
    <>
      <View style={styles.container}>

      <Camera style={styles.camera} type={type} ref={cameraReferencia}>

      <View style={styles.buttonContainer}>
      <TouchableOpacity style={styles.button} onPress={() => { setType( type === Camera.Constants.Type.back ? Camera.Constants.Type.front : Camera.Constants.Type.back ); }}>
        <Text style={styles.text}>Virar</Text>
      </TouchableOpacity>
      </View>
      </Camera>
      <TouchableOpacity style={styles.buttonTake} onPress={takePicture}>
        <Text style={styles.text}>Tirar Foto</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.buttonTake} onPress={() => navigation.goBack()}>
        <Text style={styles.text}>Voltar</Text>
      </TouchableOpacity>

      </View>
    </>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'transparent'
  },
  camera: {
    flex: 1,
  },
  buttonContainer: {
    flex: 1,
    backgroundColor: 'transparent',
    flexDirection: 'row',
    margin: 20,
  },
  button: {
    flex: 0.1,
    alignSelf: 'flex-end',
    alignItems: 'center',
  },
  text: {
    fontSize: 18,
    width: 50,
    marginLeft: 20,
    fontWeight: 'bold',
    color: 'black',
  },
  buttonTake: {
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#000',
    color: 'white',
    margin: 20,
    height: 50
  }
});

export default Photo;
