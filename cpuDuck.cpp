#include <iostream>

extern "C" void asm_fake_jmp();
extern "C" void fake_jmp_end();
void fake_jmp_end() {
    printf("you are intel cpu \n");
}

int main()
{
	__try
	{
		asm_fake_jmp();
	}
	__except (1)
	{
		printf("you are amd cpu \n");
	}
    system("pause");
}