using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ToMenuPauseScreenButton : MonoBehaviour
{
    [SerializeField] string mainMenuSceneName = "MainMenu";
    public void ToMainMenu()
    {
        SceneLoadManager.instance.LoadNewScene(gameObject.scene, mainMenuSceneName, Vector3.zero, Vector3.zero, false);
    }
}
