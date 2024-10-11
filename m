Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A9599A80D
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2024 17:41:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ9p43pTGz3c54
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Oct 2024 02:41:16 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728661274;
	cv=none; b=BR9Q7dF///FI+/yfaycEHjCbm4vBW3bvDtT3HjMnesF8/EmcoFX9Mma0gQDOq9MZToviic/VbBuk+sVmCTra33WWEjwSMPPtDqdzsHgadEbLfYEBhcXm992+m87u1OD2N3TXyDQ2ZW8L+S7Bggv38ASSM9U+D3orxQaJfVOh6NqFrNYKmwqEMc5KpD+1uh/F1nMeIuTBjNKxweYjnXbUEHdw4ZtH1kc837pGKn6VogCe5mVPCZl6J7Vfjmy69kyR7fQmVj9qrFIfpswTlxgGQnbvOtjleVd2eRMEZzDyQM0QdASscoWXo6qgSd3D7vxn/wz++RWw5s100XJPw0E2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728661274; c=relaxed/relaxed;
	bh=JEMAcjbF3FPvsYIlnj1lZs9kGTRyH0qqeK3Whe3Jzxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SEY52hWK7WNj8UisYS4ed0TYqEKAT96zdch7xiRZEqELvosznmiZ2roPN4mGtzSxX6chjUpvuOLOz/A8ULdUlXNS0lY+B1XhADdcY+9i6bb/1/jytwD/Y6qBgEx0QsIVnyTTmjowX4lIV8Gx5QQDD+H2TA2zHomM6gW3LKSLNuHF2s6bbN4onF7Qz2/sjZAPaMXP9b15pwBfon/cKq1iAlk43BPDxm17DtYIIQgWPwnyRif5IvzfK4Dmq+0ePKbf4dhTAAo5SOWuZ4Lof8si3O40jBnT03emUF+gaNZuz8zkjBQLBf+q9KXGMFiIc0X6rwyzhIOkGZczcAwfULux7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=GbrwYhiy; dkim-atps=neutral; spf=pass (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=GbrwYhiy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 342 seconds by postgrey-1.37 at boromir; Sat, 12 Oct 2024 02:41:08 AEDT
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ9nw1J7sz3c1g
	for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Oct 2024 02:41:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728661258; x=1729266058; i=markus.elfring@web.de;
	bh=JEMAcjbF3FPvsYIlnj1lZs9kGTRyH0qqeK3Whe3Jzxw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GbrwYhiy4xYfzTTKYzVdxMpLjIwX8n2AufuS/AKMCvo+8KFF7apO/VIFPcAsXD1g
	 zFspVkQJA9w8KvvIJz3eMcYY5hZr0z9+sxErpiMj+dSReAX3dqYJqlJuaPgpeOmXA
	 RA+Z5qpsAJuusFX9jHKYZBwKOj/f7EkFGD6Aji9tGWYtzQP/8L1hEXsHp0JXp2g+w
	 OqJdsBalrOaVkBer5t24F4Q0aIlJ8HirloyXvrwfq1SzaK6bZloi89jb5hZ89P5tn
	 I2J1SxfLQQgCL8SeSYpI8kXPykhASrNlGqDZ54eTMKaBzkhsRpw+RzaMJ4wtr312P
	 WBubJHu4md3/z/zL7Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MFJnX-1tA4DG3Kzx-00F9Oq; Fri, 11
 Oct 2024 17:34:23 +0200
Message-ID: <0b995a34-28c4-4ba6-8ad2-e8413c6a63f5@web.de>
Date: Fri, 11 Oct 2024 17:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] irqchip/aspeed-intc: Add support for AST27XX INTC
To: Kevin Chen <kevin_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, BMC-SW <BMC-SW@aspeedtech.com>
References: <20241009115813.2908803-3-kevin_chen@aspeedtech.com>
 <f65dd139-1021-47d6-93a1-1477d6b4ca1d@web.de>
 <PSAPR06MB4949904D1FA95DBD3EF5288A89792@PSAPR06MB4949.apcprd06.prod.outlook.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <PSAPR06MB4949904D1FA95DBD3EF5288A89792@PSAPR06MB4949.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:i9rIChLNyWYHyUTxDAbalAUCtiWIR3TehRTXM4XO7QD22dAeIcU
 2Je5blRBlhhl0Zu8Fe4xt31/nZvF0LqZnWssAuOLPnytex7FWgro8OETzQRTGPAkWKFWErq
 PduH+/NIVn9OhZGSWl2zSSFzMW5gROLqxdQVoDFwdulPU9K6gtHPo14dUC3u1+rChTDKJtL
 DUB9dP0zI/qwHYP6d/BnQ==
UI-OutboundReport: notjunk:1;M01:P0:qUSITGFKUds=;046Pm0ZMoyBBsHjEftwSSLu4+zF
 348QrAeLi9DrctlfxHaxkPccMuqXWxvO0pYrvDU6+Jf8M/plvtty0G8MoKgOGdcNJV09ShWfJ
 r5ZflbeQ+FrSxU4rzOKItTd1iZLmONvaft8DTJoexdVx+yvE0a6uvsHVsaJoZ8arX+RGuRbmk
 N9NHw4pk7C3K4MjMm4MMx59sO/OUhtU+UEJrDrdwFQ4tf+Us8mjU6LNlrrW0oL8UXHB2xOM3f
 czGJ8MW978k2DM/d2j0r1S5+VBhQyniziNh5X6CwzVpPTIkFLsPabVIsM6DtY1heJXqmJDSBx
 vsGQGMFuEwbPUJb6bxyeNp41GCRydpAY88NiUCuef/9a5cNcOEGgyY46wLrzO11GmWA6gdKho
 0EFPwXmP6e8qQhom6UOgMlRJ5u6iAqiZNY3P95QcbNTFL4zGXcgXICRuWY44XEaEYI70A2duT
 Wcusq/sd7y++Y8m7URoSJcF+Tr3RMzQNco8W02HXTU+600xKLVH475hPLLVmIc6W09BoX2+Ih
 wfinTa+WXa++TXZy+qnOiI+Okyks2xypSE7wqdzZ/1yVYaWRLN+4XhzZtz4F0+ViFBYziuFGi
 jbhImp5XfKTZl5JSrjdY6bpUAJECYhc1BhTpKfvc43TyHjIaYKQ3/babKvJeyNUFCsZulUQli
 uY87ak41n6M/C8+GjwuJLKcBkwTBtlFkZUHs8JzX+BKW+fZw/oAatqQZ7Tuy9b5SfdWEMwFn+
 k54Yv72i7ZaLt4W3mv0e80RJb1fOWO/GyeDy2O1ZqivdT9/1BiTSmwIam7iDSH9ajjqAKXZSx
 1tEPBScdAwy3usS24aZpLwog==
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

>> =E2=80=A6
>>> +++ b/drivers/irqchip/irq-aspeed-intc.c
>>> @@ -0,0 +1,139 @@
>> =E2=80=A6
>>> +static void aspeed_intc_ic_irq_handler(struct irq_desc *desc)
>> +{
>>> +	struct aspeed_intc_ic *intc_ic =3D irq_desc_get_handler_data(desc);
>>> +	struct irq_chip *chip =3D irq_desc_get_chip(desc);
>>> +	unsigned long bit, status;
>>
>> I suggest to reduce the scopes for three local variables.
> May I check the scopes of bit and status usage?
> Variables of bit and status are used in for_each_set_bit.
> How could I reduce the scopes?

I propose to move selected variable definitions into corresponding compoun=
d statements
(by using extra curly brackets).
https://refactoring.com/catalog/reduceScopeOfVariable.html


>> Would you become interested to collaborate with another scoped guard fo=
r
>> this programming interface?
>> https://elixir.bootlin.com/linux/v6.12-rc2/source/include/linux/irqchip=
/chained
>> _irq.h#L13
>
> Maybe like the change in the following?
>
> diff --git a/drivers/irqchip/irq-aspeed-intc.c b/drivers/irqchip/irq-asp=
eed-intc.c
> index ef1c095ad09e..54d1881c56c6 100644
> --- a/drivers/irqchip/irq-aspeed-intc.c
> +++ b/drivers/irqchip/irq-aspeed-intc.c
> @@ -32,7 +32,7 @@ static void aspeed_intc_ic_irq_handler(struct irq_desc=
 *desc)
>         struct irq_chip *chip =3D irq_desc_get_chip(desc);
>         unsigned long bit, status;
>
> -       chained_irq_enter(chip, desc);
> +       guard(chained_irq)(desc);
>
>         scoped_guard(raw_spinlock, &intc_ic->gic_lock) {
>                 status =3D readl(intc_ic->base + INTC_INT_STATUS_REG);

Perhaps.


> @@ -41,8 +41,6 @@ static void aspeed_intc_ic_irq_handler(struct irq_desc=
 *desc)
>                         writel(BIT(bit), intc_ic->base + INTC_INT_STATUS=
_REG);
>                 }
>         }
> -
> -       chained_irq_exit(chip, desc);
>  }
=E2=80=A6

Probably, yes.


=E2=80=A6
> +++ b/include/linux/irqchip/chained_irq.h
> @@ -38,4 +38,5 @@ static inline void chained_irq_exit(struct irq_chip *c=
hip,
>                 chip->irq_unmask(&desc->irq_data);
>  }
>
> +DEFINE_GUARD (chained_irq, struct irq_desc * , chained_irq_exit ( _T ->=
irq_data.chip, _T ), chained_irq_enter (_T->irq_data.chip, _T))
=E2=80=A6

* Such a macro call looks promising.
  Would you like to omit any space characters before open parentheses?

* Would you like to support scoped guard variants accordingly?


Regards,
Markus
