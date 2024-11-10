# Version History

## Version 1.0.0 (2024-11-10)

- **Refactorización y personalización**: Transformación y simplificación del proyecto Omakub para adaptarse mejor a sistemas basados en Ubuntu sin GNOME, optimizando el flujo de instalación y configuraciones predeterminadas.
- **Nueva estructura modular de instalación**:
  - `install.sh` fue reorganizado para ejecutar los módulos en el orden adecuado: `check-version.sh`, `desktop.sh`, `first-run-choices.sh`, y finalmente `terminal.sh`.
  - `terminal.sh` ahora instala primero las herramientas requeridas, como `curl`, `git`, y `unzip`, y luego ejecuta los instaladores de terminal adicionales.
  - La instalación de aplicaciones de escritorio ahora solo se ejecuta si se detecta un entorno gráfico.
- **Actualización de las fuentes**:
  - Reemplazado el script de instalación de fuentes para utilizar exclusivamente la fuente **Meslo Nerd Font** en lugar de otras fuentes innecesarias.
  - Eliminado el archivo `fonts.sh` original, reemplazándolo con un script de instalación específico para Meslo.
- **Eliminación de aplicaciones opcionales no deseadas**:
  - Eliminado el script `app-1password.sh` de las aplicaciones opcionales, reduciendo la dependencia de aplicaciones no esenciales.
- **Actualización del README**:
  - Personalización del README para reflejar que este es un fork adaptado para sistemas como Linux Mint, con una lista clara de características.
  - Detalles específicos sobre herramientas de terminal y configuraciones ligeras, incluyendo el uso de Meslo Nerd Font, el tema Dracula, y aplicaciones clave como `obs-studio`, `spotify`, y `steam`.
- **Control de versiones manual**:
  - Agregado un flujo para generar archivos `.diff` temporales entre los dos últimos commits para ayudar en la documentación manual de `VERSION_HISTORY.md`.
- **Configuración de Tilix como terminal predeterminada**:
  - Configuración de Tilix como emulador de terminal predeterminado en lugar de Konsole, incluyendo ajustes de atajos y funcionalidades avanzadas para gestionar paneles y pestañas.

Este lanzamiento inicial (v1.0.0) representa una versión personalizada de Omakub, optimizada para un flujo de trabajo en Linux Mint o cualquier sistema basado en Ubuntu sin GNOME.
