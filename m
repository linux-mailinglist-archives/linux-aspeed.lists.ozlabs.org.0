Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5364EFC97
	for <lists+linux-aspeed@lfdr.de>; Sat,  2 Apr 2022 00:07:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVZ6f1ydGz301M
	for <lists+linux-aspeed@lfdr.de>; Sat,  2 Apr 2022 09:07:54 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.54.81;
 helo=smtpout3.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout3.mo529.mail-out.ovh.net
 (smtpout3.mo529.mail-out.ovh.net [46.105.54.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVZ6T5rT4z2xt7
 for <linux-aspeed@lists.ozlabs.org>; Sat,  2 Apr 2022 09:07:42 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.188])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 672C0F25DD57;
 Sat,  2 Apr 2022 00:07:36 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 2 Apr
 2022 00:07:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006e3700b63-f463-4ad6-a72b-c19128217135,
 A74503F7E5587F569FD34A1240EFF25B47FA7F20) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d652e592-29ce-3920-d1f8-66b3a617033f@kaod.org>
Date: Sat, 2 Apr 2022 00:07:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 0/7] Fix AST2600 quad mode SPI pinmux settings
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Joel Stanley <joel@jms.id.au>
References: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
 <CACPK8Xed5Kh_Y2B3NY41bjgoALvz1gC4zbNfmUaHn_8EbHio4g@mail.gmail.com>
 <ea2ecef9-f47f-2a4e-8dda-ffd0c3691389@quicinc.com>
 <c4bcb633-02d2-1cd5-3485-787ebd4b1e0a@kaod.org>
 <42694139-61d0-fb0d-d4c3-a81cc31488d2@quicinc.com>
 <e362f6dd-785f-87b3-3090-554be0fb860c@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <e362f6dd-785f-87b3-3090-554be0fb860c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c00a9726-7d7c-46c0-b22a-64bd659383fd
X-Ovh-Tracer-Id: 8622141490564074485
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiiedgudeilecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkedvgfduveekfeekledtjeetkedvgeffgeduteegtedtffejfeehkeeflefftdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, Jamie Iles <quic_jiles@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Jae,

On 4/1/22 16:10, Jae Hyun Yoo wrote:
> Hi Cédric,
> 
> On 3/31/2022 9:06 AM, Jae Hyun Yoo wrote:
>> Hello Cédric,
>>
>> On 3/31/2022 8:56 AM, Cédric Le Goater wrote:
>>> Hello Jae,
>>>
>>> On 3/31/22 17:44, Jae Hyun Yoo wrote:
>>>> On 3/30/2022 10:50 PM, Joel Stanley wrote:
>>>>> On Tue, 29 Mar 2022 at 17:40, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>>>>>>
>>>>>> I’m sending this patch series to fix current issues in AST2600 pinmux
>>>>>> settings while enabling quad mode SPI support.
>>>>>>
>>>>>> FWSPI18 pins are basically 1.8v logic pins that are different from the
>>>>>> dedicated FWSPI pins that provide 3.3v logic level, so FWSPI18 pins can’t
>>>>>> be grouped with FWSPIDQ2 and FWSPIDQ3, so this series fix the issue.
>>>>>>
>>>>>> Also, fixes QSPI1 and QSPI2 function settings in AST2600 pinctrl dtsi to
>>>>>> make it able to enable quad mode on SPI1 and SPI2 interfaces.
>>>>>>
>>>>>> With this series, quad mode pinmux can be set like below.
>>>>>>
>>>>>> FW SPI:
>>>>>> &fmc {
>>>>>>          pinctrl-names = "default";
>>>>>>          pinctrl-0 = <&pinctrl_fwqspi_default>;
>>>>>> }
>>>>>>
>>>>>> SPI1:
>>>>>> &spi1 {
>>>>>>          pinctrl-names = "default";
>>>>>>          pinctrl-0 = <&pinctrl_qspi1_default>;
>>>>>> }
>>>>>>
>>>>>> SPI2:
>>>>>> &spi2 {
>>>>>>          pinctrl-names = "default";
>>>>>>          pinctrl-0 = <&pinctrl_qspi2_default>;
>>>>>> }
>>>>>
>>>>> Thanks. I hope to see a board from you that uses this soon :)
>>>>>
>>>>> I'll send the patches as fixes once -rc1 is out.
>>>>
>>>> Thanks Joel!
>>>>
>>>> Yes, I would be able to send my BMC board dts soon.
>>>> Thanks in advance for your review on that too.
>>>
>>> Out of curiosity, which driver are you using ? the one from SDK ?
>>>
>>> I proposed a new one for upstream supporting all AST2400, AST2500, AST2600
>>> controllers. I would be glad to have some feedback if you have time.
>>
>> Yes, I saw your patch set of the new driver.
>>
>> I'm currently using this fix with legacy aspeed-smc driver after
>> adding some fixes. I'll give it a try with your new driver as well and
>> will give you some feedback if I find any.
> 
> I tested this patch series using the new spi-aspeed-smc driver you
> proposed.
> 
> https://lore.kernel.org/linux-arm-kernel/20220325100849.2019209-1-clg@kaod.org/
> 
> I modified my BMC's device tree like below to enable quad mode.
> 
>      &fmc {
>          status = "okay";
>          pinctrl-names = "default";
>          pinctrl-0 = <&pinctrl_fwqspi_default>;
> 
>          flash@0 {
>              status = "okay";
>              m25p,fast-read;
>              label = "bmc";
>              spi-rx-bus-width = <4>;
>              spi-max-frequency = <133000000>;
>      #include "openbmc-flash-layout-64.dtsi"
>          };
> 
>          flash@1 {
>              status = "okay";
>              m25p,fast-read;
>              label = "alt-bmc";
>              spi-rx-bus-width = <4>;
>              spi-max-frequency = <133000000>;
>      #include "openbmc-flash-layout-64-alt.dtsi"
>          };
>      };

Ah ! I have an AST2600 A0 EVB without FWQSPI wires and I could not test.
I am glad you did. Thanks.

I did test the SPI1/SPI2 controllers with Quad SPI activated and results
were OK. I think we could include your changes above in my patchset
since A0 boards are pretty rare these days and unsupported.

> And I got these kernel boot logs.
> 
> [    0.720745] spi-nor spi0.0: w25q512nwfm (65536 Kbytes)
> [    0.837368] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:4 [0x406c0741]
> [    0.846352] 5 fixed-partitions partitions found on MTD device bmc
> [    0.853220] Creating 5 MTD partitions on "bmc":
> [    0.858295] 0x000000000000-0x0000000e0000 : "u-boot"
> [    0.865014] 0x0000000e0000-0x000000100000 : "u-boot-env"
> [    0.872229] 0x000000100000-0x000000a00000 : "kernel"
> [    0.878963] 0x000000a00000-0x000002a00000 : "rofs"
> [    0.885406] 0x000002a00000-0x000004000000 : "rwfs"
> [    0.892880] spi-nor spi0.1: w25q512nwfm (65536 Kbytes)
> [    1.009460] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:4 [0x406c0741]
> [    1.018334] 5 fixed-partitions partitions found on MTD device alt-bmc
> [    1.025537] Creating 5 MTD partitions on "alt-bmc":
> [    1.031027] 0x000000000000-0x0000000e0000 : "u-boot-alt"
> [    1.038165] 0x0000000e0000-0x000000100000 : "u-boot-env-alt"
> [    1.045623] 0x000000100000-0x000000a00000 : "kernel-alt"
> [    1.052807] 0x000000a00000-0x000002a00000 : "rofs-alt"
> [    1.059800] 0x000002a00000-0x000004000000 : "rwfs-alt"
> 
> As you can see in the log, FMC10[31:28] and FMC14[31:28] are properly
> set to 0100b which means 'quad bit read/write, data cycle only'.

yes and Quad Output SPI opcode (0x6c)

> I verified that your new driver supports quad mode properly and it has
> worked well so far without making any issue.
> 
> Thanks for your making the new driver.
> I left my comment in your patch proposal thread.

I will include your 'Tested' tag in v5. I hope to address Pratyush comments
next week. Thanks a lot for the support.

Cheers,

C.
