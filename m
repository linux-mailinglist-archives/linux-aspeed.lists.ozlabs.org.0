Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCA1950185
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Aug 2024 11:48:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QiNAKkSK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjmmX0XHDz2xfR
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Aug 2024 19:48:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QiNAKkSK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjmmR0mCWz2xYc
	for <linux-aspeed@lists.ozlabs.org>; Tue, 13 Aug 2024 19:48:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC908615D9;
	Tue, 13 Aug 2024 09:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D7DC4AF09;
	Tue, 13 Aug 2024 09:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723542516;
	bh=dyRheu5fkc36+Z6U55nfDJfyAv0UpJ9ogHZFM42QJM4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=QiNAKkSKIF0gzskpmY+GtpgZky72EAJhl9omsxNkvhqpMGKIunNW04TMZJ/z1jxr+
	 mbjnbkxNxJ+9Z5YzaSz5VVWCV25iKn4iP3rAnly/60463oY7i5kHXdru2SokHUTNJ2
	 Z+y/EfEyEtOcCl6rtxfXv/wPpQL8a+c3WTRyCqNPf4Z0gFgwGSbG3gBolKC3UkIZCM
	 O+wf4dJ2j3T1LbZJ9fSn8kmaI4cPLR6oJrAWDso6XCLNK6l8y3QeYzf8D//SQ2C7Lp
	 nlvefdp7BVEQZvOlaloxKy/ngP4IhxaU5BHu0+tu3ekPXCbtUlGhIuICxJx5ZdftAN
	 GXa4lCyHGGlTA==
Message-ID: <13e6625f-9f62-4973-b8f2-e825bd7665ee@kernel.org>
Date: Tue, 13 Aug 2024 11:48:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuimhjogW1BBVENIIHYxIDIvMl0gaXJxY2hpcC9hc3BlZWQt?=
 =?UTF-8?Q?intc=3A_Add_support_for_10_INTC_interrupts_on_AST27XX_platforms?=
To: Kevin Chen <kevin_chen@aspeedtech.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
 <joel@jms.id.au>, "andrew@codeconstruct.com.au"
 <andrew@codeconstruct.com.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
References: <20240813074338.969883-1-kevin_chen@aspeedtech.com>
 <20240813074338.969883-3-kevin_chen@aspeedtech.com>
 <315f9095-8928-44a9-bab7-a924a070eded@kernel.org>
 <PSAPR06MB4949680EBF66DCD47F2B4CF889862@PSAPR06MB4949.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <PSAPR06MB4949680EBF66DCD47F2B4CF889862@PSAPR06MB4949.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 13/08/2024 11:44, Kevin Chen wrote:
> Hi Krzk,
> 
> In ASPEED, ast2400/2500/2600 use arm architecture with KCONFIG_ARCH_ASPEED which slect MACH_ASPEED_G4/G5/G6 in arch/arm/mach-aspeed/Kconfig.
> In the fureture, there would be ast2800/2900/... using arm64. We need to clarify the IC generation between 7th/8th/9th/....
> 
> Maybe change ARCH_ASPEED/MACH_ASPEEDG7 to ARCH_ASPEED first.
> Or, do you have better Kconfig usage?

Fix your quotes and do not top-post.

Please respond inline, instead of top-posting, because it makes your
emails hard to follow.
https://elixir.bootlin.com/linux/v6.8-rc7/source/Documentation/process/submitting-patches.rst#L340

> 
> 
>> +config ARCH_ASPEED
>> +     bool "Aspeed SoC family"
>> +     select MACH_ASPEED_G7
>> +     help
>> +       Say yes if you intend to run on an Aspeed ast2700 or similar
>> +       seventh generation Aspeed BMCs.
>> +
>> +config MACH_ASPEED_G7
>> +     bool "Aspeed SoC AST2700"
> 
> There are no MACHines for arm64. Look at this code. Do you see MACH
> anywhere else? No. Then why Aspeed must be different?

What is this?

> 
> --
> Best Regards,
> Kevin. Chen
> 
> ________________________________
> 寄件者: Krzysztof Kozlowski <krzk@kernel.org>
> 寄件日期: 2024年8月13日 下午 04:50
> 收件者: Kevin Chen <kevin_chen@aspeedtech.com>; tglx@linutronix.de <tglx@linutronix.de>; robh@kernel.org <robh@kernel.org>; krzk+dt@kernel.org <krzk+dt@kernel.org>; conor+dt@kernel.org <conor+dt@kernel.org>; joel@jms.id.au <joel@jms.id.au>; andrew@codeconstruct.com.au <andrew@codeconstruct.com.au>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arm-kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>; linux-aspeed@lists.ozlabs.org <linux-aspeed@lists.ozlabs.org>
> 主旨: Re: [PATCH v1 2/2] irqchip/aspeed-intc: Add support for 10 INTC interrupts on AST27XX platforms
> 

...

>> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
>> index 15635812b2d6..d2fe686ae018 100644
>> --- a/drivers/irqchip/Makefile
>> +++ b/drivers/irqchip/Makefile
>> @@ -84,6 +84,7 @@ obj-$(CONFIG_MVEBU_SEI)                     += irq-mvebu-sei.o
>>  obj-$(CONFIG_LS_EXTIRQ)                      += irq-ls-extirq.o
>>  obj-$(CONFIG_LS_SCFG_MSI)            += irq-ls-scfg-msi.o
>>  obj-$(CONFIG_ARCH_ASPEED)            += irq-aspeed-vic.o irq-aspeed-i2c-ic.o irq-aspeed-scu-ic.o
>> +obj-$(CONFIG_MACH_ASPEED_G7)         += irq-aspeed-intc.o
> 
> There is no such thing as CONFIG_MACH_ASPEED_G7. And there will never be.
> 
> You already received feedback on this, so why do you keep pushing your
> solution? You did not respond to any feedback given, just send the same
> and the same till we agree?
> 
> NAK.

And this?

> 
>>  obj-$(CONFIG_STM32MP_EXTI)           += irq-stm32mp-exti.o
>>  obj-$(CONFIG_STM32_EXTI)              += irq-stm32-exti.o
>>  obj-$(CONFIG_QCOM_IRQ_COMBINER)              += qcom-irq-combiner.o
>> diff --git a/drivers/irqchip/irq-aspeed-intc.c b/drivers/irqchip/irq-aspeed-intc.c
>> new file mode 100644
>> index 000000000000..71407475fb27
> 

...

> 
> ************* Email Confidentiality Notice ********************
> 免責聲明:
> 本信件(或其附件)可能包含機密資訊，並受法律保護。如 台端非指定之收件者，請以電子郵件通知本電子郵件之發送者, 並請立即刪除本電子郵件及其附件和銷毀所有複印件。謝謝您的合作!
> 
> DISCLAIMER:
> This message (and any attachments) may contain legally privileged and/or other confidential information. If you have received it in error, please notify the sender by reply e-mail and immediately delete the e-mail and any attachments without copying or disclosing the contents. Thank you.

Maybe I am the intended recipient of your message, maybe not. I don't
want to have any legal questions regarding upstream, public
collaboration, thus probably I should just remove your messages.

Please talk with your IT that such disclaimers in open-source are not
desired (and maybe even harmful).
If you do not understand why, please also see:
https://www.youtube.com/live/fMeH7wqOwXA?si=GY7igfbda6vnjXlJ&t=835

If you need to go around company SMTP server, then consider using b4
web-relay: https://b4.docs.kernel.org/en/latest/contributor/send.html

Please be informed that by responding to this email you agree that all
communications from you and/or your company is made public. In other
words, all messages originating from you and/or your company will be
made public.

You already received exactly this feedback. Around three times. If you
keep ignoring feedback, I will keep NAKing your patches.

Best regards,
Krzysztof

