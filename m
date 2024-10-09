Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C09996A34
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 14:38:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNsrZ2f0Fz3bgQ
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 23:38:54 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.3
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728477532;
	cv=none; b=jCyCE3zLfxwloOY9peMp5D5jqxNkzxeO1fe7azii4eQoIKSVo9yxXfSzSy36qFUKcga+K2Ff2BtdS6CDNK/6lYaKPncM9/i7HqvLVyGwH/Iftt5OiRrxsI3ZsM4O0dkOR+uecEgxSCFRH6CTFC4FN09dxLGOtCwB0VateGCevhTY3NWSoI6QeW1DfM0UjRBQhhfLbHJ2bkvZAJBiJ1AObOQgu2QiPJKows+DGHg75/IX4pCHsrv/ntE7ERzlf8wNX0QAIVPouLQ/Nh72k7fw9xDl1xMX+J6/4Lj5mIo1w2ZuUfHbMaYShCGK+UIBPHBtdksZsqLUxJ8DsbRG9p0bXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728477532; c=relaxed/relaxed;
	bh=fTLC63/37zNTLhxxSZfbfT1jlj/UPeR+t+SxAKcPCzw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Xj7AmmawTKTsW5OrcqyNfM2TRxzLpT8cOF6lL09b3CaOIQR3Lh30Uv/a0Kv8ttWxPi4ZNoaOpq3FDX2+4rKC33b9IbRY98StT1cGkuAypdGNb+RODi9iUIsqK14wqbuxNo5OfMqK7nTBAgXEvibrFz2A10Mk32igPm6tEwZDbBfDped+i4tcWzhrIGk5dr79whzUT4D5gtZO7zt+JEFc2bAdzVYHhPhtKnZrP9gMQTJZEDa2YpSpmhUDfLNBnfCDdSr86jDYFMX2IyzuF/QzrZCGdnwsaY+fDLBtT9iJgMPwkckDFnkJpUWMkDsqV0TPiCe0H0Y0CNYiNxvAv+lL0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=PcBjIwdk; dkim-atps=neutral; spf=pass (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=PcBjIwdk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 339 seconds by postgrey-1.37 at boromir; Wed, 09 Oct 2024 23:38:48 AEDT
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNsrS6XnZz3bbp
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Oct 2024 23:38:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728477516; x=1729082316; i=markus.elfring@web.de;
	bh=fTLC63/37zNTLhxxSZfbfT1jlj/UPeR+t+SxAKcPCzw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PcBjIwdk3tMn8PLlKjkBftZJaEmmqBSh/QKpD7P+c4Nm78OXdqOrfxG4ou49XHiV
	 u210qX+YH6PVR0P+0+zcEKN/ZgJhDQqESAGNxNM6zRLdGlTe+MTCKDWO+fBk3YZ2W
	 Mesg85H7SFsGfROTT6lEFcpIe6ataXkK2SGBFSnpBw6nWC4X4DwTf11XwqZqDBKn5
	 LcIXu61x2o1JoClfrD4V8LK0JYMO3+3QRbrr9jgQ0g/lIo3QrvNoRTmpW1i5Eifg6
	 Ni4kxzxmH7ddLULx+tnqUBGfXfH4pD9JN6e30IREz8181n2NY4FnFhZPR9RqXxwoh
	 swS3gMCNBweyJdW2XA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MYLig-1tSde13LgA-00Vu41; Wed, 09
 Oct 2024 14:32:15 +0200
Message-ID: <f65dd139-1021-47d6-93a1-1477d6b4ca1d@web.de>
Date: Wed, 9 Oct 2024 14:32:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kevin Chen <kevin_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20241009115813.2908803-3-kevin_chen@aspeedtech.com>
Subject: Re: [PATCH v3 2/2] irqchip/aspeed-intc: Add support for AST27XX INTC
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241009115813.2908803-3-kevin_chen@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PCpmLz+Zi0O7z1Jgav1HZtP81S2dqF8GZsxRQVqHNWM4Mor8A4k
 /EEuB9727FeHAmnW7fxJoJePoxEYlN9j9IYWCGumLgQOwzkHTXiTWxdI3xHyO36MQFrr+ax
 pqY0vQPOReTPPYQcsQqIbZLzEmqB7p5WbvOh/MrlpSwh7VfFyUIthzeK0HTOZzFeQ1I1bxX
 nnK5zBJYtsUNLnhNRNUOQ==
UI-OutboundReport: notjunk:1;M01:P0:wsqpkoe0vmI=;+jvXbhIEXMKNQWK6usRU7BVI8Cl
 pZXXRqJ893U4uqFiMCFMh7Jx1EmwkuuDWZTwsYO4yDOXAPie3Y7Eq17FiW2TEyvw6voEoOgHQ
 X6P2tp0nUYRnKBva7LfcSJawMuIqIjU5QTJ9dQ6YabVxTYL8GRFTrqUMhNBUqul6dVjfeng6r
 JLvSNzYevl0iFODxu/kNtsa9kOhCXTd2qG/aWb1EqxZwuipPsz7YejQFrafGEO7tr0rfcGn0X
 k4AJgSttDRmBDr6eg6Ey7ebIPcIjGlEhpP5pB5rAzw8VZNYNOY/aOWHv3HR2V0/E3QdsTvI8I
 PgoksQwAOgAZi+7ODzbxCKPKEQL7Z7SYqRPR+MAAG9lsJ+2W1FqnoAljpdI/MWflOTQZt6xnf
 V+JQ6IDVrtnrJufJoZlZPblTANQa99xmVcwYBJCYKOV42qQ5jTA5mrsgSisF3HXQZLqWjqLF8
 GIp0lbzc5f0C5+QUY3mZ/OKniWSMy2IcvmynxJ+YUfwda743f6n6+aS9LjhhP/CXT3pc61CEf
 LYOA40+uawzKvcTL6/6T6O8RVYwJ98jT3efpODkCGRPxtRZn52MtyBVNL9K7u+zq0KQ1QxmZp
 MT86f5twCHKDfm8K5MHfgkclA9ClaJA8XoGJpOylUduP9V3qE/DXw7hu9CKNWwtjhtyg/LRNZ
 3hgAnjUtdnKUZxOqtrwIVIrrdEdB/C3lGDX1vSbhyZWbpaL9gjANbRr46zT4/ji0KQinjV9qK
 qw/oexg2eB5JT3P5BoS7aI2QHDzIVfi6+iyxCouNxg5ovCEp7V8Xo/38CDKFiCwDOEFMWkIW0
 6hZcjVQeJJxksVfrbboVBq/A==
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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

=E2=80=A6
> To support ASPEED interrupt controller(INTC) maps the internal interrupt
> sources of the AST27XX device to an parent interrupt controller.
> ---

* I miss your tag =E2=80=9CSigned-off-by=E2=80=9D.
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.12-rc2#n396

* How do you think about to choose an additional imperative wording
  for an improved change description?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.12-rc2#n94


=E2=80=A6
> +++ b/drivers/irqchip/irq-aspeed-intc.c
> @@ -0,0 +1,139 @@
=E2=80=A6
> +static void aspeed_intc_ic_irq_handler(struct irq_desc *desc)
+{
> +	struct aspeed_intc_ic *intc_ic =3D irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +	unsigned long bit, status;

I suggest to reduce the scopes for three local variables.


> +
> +	chained_irq_enter(chip, desc);

Would you become interested to collaborate with another scoped guard
for this programming interface?
https://elixir.bootlin.com/linux/v6.12-rc2/source/include/linux/irqchip/ch=
ained_irq.h#L13


> +
> +	scoped_guard(raw_spinlock, &intc_ic->gic_lock) {
> +		status =3D readl(intc_ic->base + INTC_INT_STATUS_REG);
> +		for_each_set_bit(bit, &status, IRQS_PER_WORD) {
> +			generic_handle_domain_irq(intc_ic->irq_domain, bit);
> +			writel(BIT(bit), intc_ic->base + INTC_INT_STATUS_REG);
> +		}
> +	}
> +
> +	chained_irq_exit(chip, desc);
> +}


Regards,
Markus
