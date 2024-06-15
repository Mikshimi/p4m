import 'package:flutter/material.dart';


BoxDecoration avatar(userImage, primaryColor, shadowColor1, shadowColor2)
{
  BoxDecoration avatarDecoration = BoxDecoration(
      shape: BoxShape.circle,
      color: primaryColor,
      boxShadow: [
        BoxShadow(
          color: shadowColor1,
          offset: const Offset(10, 10),
          blurRadius: 10,
        ),
        BoxShadow(
          color: shadowColor2,
          offset: const Offset(-10, -10),
          blurRadius: 10,
        ),
      ],
      image: userImage,
      
  );

  return avatarDecoration;
}
