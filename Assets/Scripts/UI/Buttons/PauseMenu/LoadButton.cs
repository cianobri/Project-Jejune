using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LoadButton : MonoBehaviour
{
    public void LoadGame()
    {
        //Debug.Log("Loading from " + Application.persistentDataPath);
        PauseScreen.instance.ResumeGame();
        SaveSystem.instance.LoadGame("testSave"); 
    }
}
