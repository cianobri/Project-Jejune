using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public interface IInteractable
{
    void SetInteractableActive();

    void SetInteractableNotActive();

    void Interact(); 

    void Highlight(); 

    void Unhighlight(); 
    
    void OnInteraction();
}
