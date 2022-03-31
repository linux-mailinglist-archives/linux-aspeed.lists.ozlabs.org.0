Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 070A34EDE10
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 17:56:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTnx36K81z2ynF
	for <lists+linux-aspeed@lfdr.de>; Fri,  1 Apr 2022 02:56:55 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTnww25VBz2y7M
 for <linux-aspeed@lists.ozlabs.org>; Fri,  1 Apr 2022 02:56:45 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.25])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BDC1AF1DED3C;
 Thu, 31 Mar 2022 17:56:39 +0200 (CEST)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 31 Mar
 2022 17:56:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0012aa6e524-85ac-47d8-bf7f-916ca4c206a4,
 FC9088D273F6636B0CAAD4892A2C3D02B7ACC8E0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c4bcb633-02d2-1cd5-3485-787ebd4b1e0a@kaod.org>
Date: Thu, 31 Mar 2022 17:56:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 0/7] Fix AST2600 quad mode SPI pinmux settings
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Joel Stanley <joel@jms.id.au>
References: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
 <CACPK8Xed5Kh_Y2B3NY41bjgoALvz1gC4zbNfmUaHn_8EbHio4g@mail.gmail.com>
 <ea2ecef9-f47f-2a4e-8dda-ffd0c3691389@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ea2ecef9-f47f-2a4e-8dda-ffd0c3691389@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7fd801bd-a94f-4719-9b66-bfbc424dd197
X-Ovh-Tracer-Id: 14931403090787666933
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
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

On 3/31/22 17:44, Jae Hyun Yoo wrote:
> On 3/30/2022 10:50 PM, Joel Stanley wrote:
>> On Tue, 29 Mar 2022 at 17:40, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>>>
>>> I’m sending this patch series to fix current issues in AST2600 pinmux
>>> settings while enabling quad mode SPI support.
>>>
>>> FWSPI18 pins are basically 1.8v logic pins that are different from the
>>> dedicated FWSPI pins that provide 3.3v logic level, so FWSPI18 pins can’t
>>> be grouped with FWSPIDQ2 and FWSPIDQ3, so this series fix the issue.
>>>
>>> Also, fixes QSPI1 and QSPI2 function settings in AST2600 pinctrl dtsi to
>>> make it able to enable quad mode on SPI1 and SPI2 interfaces.
>>>
>>> With this series, quad mode pinmux can be set like below.
>>>
>>> FW SPI:
>>> &fmc {
>>>          pinctrl-names = "default";
>>>          pinctrl-0 = <&pinctrl_fwqspi_default>;
>>> }
>>>
>>> SPI1:
>>> &spi1 {
>>>          pinctrl-names = "default";
>>>          pinctrl-0 = <&pinctrl_qspi1_default>;
>>> }
>>>
>>> SPI2:
>>> &spi2 {
>>>          pinctrl-names = "default";
>>>          pinctrl-0 = <&pinctrl_qspi2_default>;
>>> }
>>
>> Thanks. I hope to see a board from you that uses this soon :)
>>
>> I'll send the patches as fixes once -rc1 is out.
> 
> Thanks Joel!
> 
> Yes, I would be able to send my BMC board dts soon.
> Thanks in advance for your review on that too.

Out of curiosity, which driver are you using ? the one from SDK ?

I proposed a new one for upstream supporting all AST2400, AST2500, AST2600
controllers. I would be glad to have some feedback if you have time.

Thanks,

C.
