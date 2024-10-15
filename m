Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF9199F0CB
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Oct 2024 17:14:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSd1V4vzPz3byl
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2024 02:14:38 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729005277;
	cv=none; b=dP2X2ImwbZ6cJ07vsGYLmH+me9Fq2um9laEkRK8Jf9XuqnM/H07n7JPv1NmAQ0MR0kubFNdrAgCMazMyFZNLDjS7IHXlI3syGfdxAXANrPySYl23h8t7OhgkEDcLFl1cZVBQVUiDe03NEQuDKmFmjwVjUwlynrjeUMyeNU9QnoWZAdjaKQMuJxqgiTVn35h5XcTFnwbQushXnNxNjCxnFiiMSGZyKmKnW1JzD65sswq/kCxdzXl7DmtBJcR5VfkVUoRs2Sk7gAqhnNQKzgdWY5Nj1J+Ndd/9vYEcPy/p9Vx66gxBO/piuznRJjaruNdiCS6kBr2p7j4vjJXn8pl5lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729005277; c=relaxed/relaxed;
	bh=MaPDtsAu0VZDFqGSAskos6W/UUdZXWKX1E7T5Bfhlow=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=ordIHLlINMZAOyrlkwuyYlyR+gqZ3zyeY0wnnU7hKtBCfO1laSbGS2WXS6ZiKP/Tam6lBHx9gKOREoL72kCIOfJhWsdBg0jhtFW39I6af+YwV+7f3S6uX5AU9L7sebZnY//hRnEC6CYhv13K29kFuNoAeGVyoyDtoiSAHCtJxPFM8PW/mFZm5j54PLr3JIwozIFJb86V7Ok1bBmbgKfC/kvyCQXltFJ3n09fTlGtVqCqUhxMmYpEy4EmOY1myBydPfTth74kiIQXlaS7oNZMEUielbUPzV6r1cyBlY6Ahy47DZ7bCq8/5PNfn5Zwb9BdWJfEowQoNJqLa0fuJz8xUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=CqnLBe28; dkim-atps=neutral; spf=pass (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=CqnLBe28;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSd1P6L6gz3bpW
	for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Oct 2024 02:14:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1729005249; x=1729610049; i=markus.elfring@web.de;
	bh=MaPDtsAu0VZDFqGSAskos6W/UUdZXWKX1E7T5Bfhlow=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CqnLBe28KRtNjw13Ck8LCwKo7NGIO4Y3nMTactozgVa0rYksUyfBOtkjPQbAKuU/
	 LbhxnFRoDOcQN/FWAYB9I1SRIQshHH9E9xZYTH1AAISxBVOjL76+HtUY249izEATn
	 IjxhuMqbOhrQ83YdECRUxPvI0zKM2uLlivMCPNx+Nlul/MKXXqcyc62uxu1eSDZvM
	 M2ARktb7XBxTFygU5SmQH15gKdkUBszQYd3zn50STT783mh6fxAa5sNenslQqPNhO
	 0KH4OZP17Fq2PP8MOP9g79au8SlFLZZ/Qkk8iGB4oDAMPnAB7mBgUvpFv8wv8jXb0
	 pxXyy1J26Qmf4WYmXg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [94.31.89.95] ([94.31.89.95]) by web-mail.web.de
 (3c-app-webde-bap19.server.lan [172.19.172.19]) (via HTTP); Tue, 15 Oct
 2024 17:07:24 +0200
MIME-Version: 1.0
Message-ID: <trinity-8fef4ba2-f5ab-4b78-b3de-aa1dc7d2fa33-1729004844102@3c-app-webde-bap19>
From: Markus Elfring <Markus.Elfring@web.de>
To: Kevin Chen <kevin_chen@aspeedtech.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org
Subject: RE: [PATCH v3 2/2] irqchip/aspeed-intc: Add support for AST27XX
 INTC
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Oct 2024 17:07:24 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <PSAPR06MB49496CC4F25425753EA4252C89452@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20241009115813.2908803-3-kevin_chen@aspeedtech.com>
 <f65dd139-1021-47d6-93a1-1477d6b4ca1d@web.de>
 <PSAPR06MB4949904D1FA95DBD3EF5288A89792@PSAPR06MB4949.apcprd06.prod.outlook.com>
 <0b995a34-28c4-4ba6-8ad2-e8413c6a63f5@web.de>
 <PSAPR06MB49491F8E0CE4069E9B9B1EA289442@PSAPR06MB4949.apcprd06.prod.outlook.com>
 <trinity-a5696b99-bf11-4ae3-8b00-20db116f86e4-1728911450361@3c-app-webde-bs22>
 <PSAPR06MB49496CC4F25425753EA4252C89452@PSAPR06MB4949.apcprd06.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:F3RU5HNCdI/jhBQpl+toJRa3DuBoVXM/3J7YtGQP8UK7HGzSQbDWkPV1QXbhmYa1fJYWS
 OT3rKdiRCJX+9hUs/QEWqw7bYCjq5DB6X9H1nPG5sBtFSjbelw9+KJRI6BrjJvEzHmSWCDSYYuVF
 MhqAxLP9hbrZtcjr58Pyok9idl9H8LpMsJCOMB8mAfnUL/YivF3D6ymuyUXT0cuW8g7l1JB65aXy
 vmPBcROpJgZfpg24+QtdQlF6FlL4XVIdNgFDbTIU1ei0HczxdoqplmDaAViogKxnqCdBRkVWF7e4
 mM=
UI-OutboundReport: notjunk:1;M01:P0:eJe4TveRrWo=;E9TRLRM9bYscIYkS+rEdDOutbSd
 8AB1wNyIwrb2koctU9TnEPPqtydagfH/DQ/7OyhSrBftbDIGy+1wF+bKut1iEFfUcJQEPrXfT
 PaOshrLztU8kbtBQsAbdrnTjCRGZx1O7PBhTuXa83Rsxl5yARDhfSESt6CRtoLoIs4EJXe2U8
 +ac9fYVkSyEq6yNvbEl8a+PYMv/QbV1vb5fVCZhuwyESGP2QnAjCKu/6BGBvzA0rpoLq9V3rl
 zKSbTK4MsqrVHMYC43/aIXhDuV5jpm/ortdCl+mRYUKBgxPFJBI+m63BGhH1cewCksY+DDiSZ
 e0QHV3T9RpWW+e383kWJ/Qkeyl9r/h1qghUBtcDXCaW0aSoDw+9fjgA8FVZ38sflsifJfDjba
 3Bdf3yggPxcvdYCESIZJSuZC8E2ke0OrO1OnEiBwd3/4lIfEy+6dcRHwZi7CfcKd/jfjRchU8
 tNNJ4jP32XlPuKVD9AiFx+iDV9Rm1FjjnxOLZ0WwNGtcfy4r2qR9ENQy0Ag/lZni1RnYcPO73
 XLIxEEjM4kjuni3miT9RJNGULp3SKb7KWd0wpcwAktLHLYGDKmhpTgSRmUpckctxOI8WJ9Apq
 WT4NjRZMn8WjwlOByqyP/9hWOhYnpzLyJgBvpiU3l7TH3l3mryIaYN4U1yY+nt7j4a9xlqfVl
 jj3eod1sQm5dArtw8LAJRVbPLngpGDASRLYmrh/H7w==
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

=E2=80=A6
> > > +static void aspeed_intc_ic_irq_handler(struct irq_desc *desc) {
=E2=80=A6
> > > +       guard(chained_irq)(desc);
> >=20
> > Using another macro call =E2=80=9Cscoped_guard(=E2=80=A6) { =E2=80=A6 =
}=E2=80=9D?
> Is it necessary to use scoped_guard(=2E=2E=2E) {=2E=2E=2E}?

It depends on corresponding case disintions=2E


> > > +       scoped_guard(raw_spinlock, &intc_ic->gic_lock) {
> >=20
> > Would you like to reconsider the proposed macro mixture once more?
> Could I check the reason for once more?

Coding style concerns =E2=80=A6?


> > > +++ b/include/linux/irqchip/chained_irq=2Eh
> > > @@ -38,4 +38,6 @@ static inline void chained_irq_exit(struct irq_chi=
p *chip,
> > >                 chip->irq_unmask(&desc->irq_data);
> > >  }
> > >
> > > +DEFINE_GUARD(chained_irq, struct irq_desc *,
> > chained_irq_exit((_T->irq_data=2Echip), (_T)),
> > > +            chained_irq_enter((_T->irq_data=2Echip), (_T)))
> >=20
> > Would you like to add a #include directive in this header file accordi=
ngly?
> Can you give me an example?

See also:
https://elixir=2Ebootlin=2Ecom/linux/v6=2E12-rc3/source/include/linux/devi=
ce=2Eh#L33

Regards,
Markus
