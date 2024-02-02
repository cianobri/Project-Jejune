using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SaveButton : MonoBehaviour
{
    public void SaveGame()
    {
        //Debug.Log("Saving to " + Application.persistentDataPath);
        PauseScreen.instance.ResumeGame();
        SaveSystem.instance.SaveGame("testSave");
    }
}
