using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NewGameMainMenu : MonoBehaviour
{
    [SerializeField] Vector3 playerInitialPosition = new Vector3(0.0f, 0.929f, 0.0f);
    [SerializeField] Vector3 playerInitialRotation = Vector3.zero;

    public void InitializeDefaultScene()
    {
        // Initialize.
        Debug.Log("Player position " + playerInitialPosition);
        SceneLoadManager.instance.LoadNewScene(gameObject.scene, GameManager.instance.defaultSceneName, playerInitialPosition, playerInitialRotation, true);
    }
}
