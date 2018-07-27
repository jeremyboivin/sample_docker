from setuptools import setup, find_packages

__NAME__ = 'project'
__VERSION__ = '0.0.0.0'


setup(
    name=__NAME__,
    version=__VERSION__,
    description="A personal project",
    author='Jérémy BOIVIN',
    author_email='jeremy.boivin.sample@nomail.fr',
    url='https://github.com/jeremyboivin/sample_docker',
    license='LICENSE.md',
    packages=find_packages(exclude=['examples', 'tests']),
    include_package_data=True,
    zip_safe=False,
    install_requires=[
        # Sample packages can be specified here
        # They will be installed before install this package
    ],
    entry_points={
        'console_scripts': [
            'sample_file = sample_file:main',
        ]
    },
    package_data={
        # Some other files than python files can be added here
    },
)
