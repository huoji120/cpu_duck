### AMD CPU与INTEL CPU指令解析问题
假设一个情况:
```cpp
66 e8 00 00 00 00
```
在x86指令集中
66会作为e8的prefix,覆盖code segment size
假设当前大小为16bit 新大小会为32bit.反之一样.

code segment size由 GDT/LDT 决定.实模式一般是16 bit("unreal"模式除外)

在x64中,我发现了一个很有意思的地方:
66 E8作为指令前缀时,AMD和INTEL呈现了完全不同的特性,即amd会遵循规则,将e8的code segment size设置为16bit 而intel则直接忽略.

这个问题已经被发现了有一段时间了,capstone在2016年,记录了这个问题.
https://github.com/capstone-engine/capstone/issues/776

这是一个概念性代码,不用CPUID判断出是INTEL还是AMD的cpu.

### 简单的思考:
能否用于混淆?
