"""
Custom commands for the ranger file manager.

Author: Benedikt Vollmerhaus
License: MIT
"""

from typing import Tuple

from ranger.api.commands import Command
from ranger.ext.get_executables import get_executables


class wal(Command):
    """
    :wal [filename] [alpha [background]]

    Generate a color scheme using Pywal with the selected or a given image.
    """

    DEFAULT_ALPHA = 98
    DEFAULT_BACKGROUND = '#0a0a0a'

    def execute(self) -> None:
        """
        Check whether Pywal is installed and run it with the given arguments.

        :return: None
        """

        if 'wal' not in get_executables():
            self.fm.notify('Could not find Pywal in PATH.', bad=True)
            return

        (image_filename, alpha, background) = self.get_arguments()

        self.fm.notify(f"Running pywal using {image_filename}.")
        self.fm.execute_command(f'wal -i "{image_filename}" '
                                f'-a {alpha} -b "{background}"')

    def get_arguments(self) -> Tuple[str, int, str]:
        """
        Parse and return a tuple with the arguments passed to the command.

        :return: A tuple with the chosen image, alpha and background color
        """

        image_filename = self.fm.thisfile.path
        alpha = self.DEFAULT_ALPHA
        background = self.DEFAULT_BACKGROUND

        if self.arg(1) and not self.arg(1).isdigit():
            image_filename = self.arg(1)
            self.shift()

        if self.arg(1).isdigit():
            alpha = self.arg(1)

            if self.arg(2):
                background = self.arg(2)

        return image_filename, alpha, background

    def tab(self, _tabnum) -> str:
        """
        Tab-complete files in the current directory.

        :return: The tab completion result
        """
        return self._tab_directory_content()
