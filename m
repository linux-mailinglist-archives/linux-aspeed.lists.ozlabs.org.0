Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C5E99CB2E
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Oct 2024 15:12:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRyLb6nBBz3c3s
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Oct 2024 00:12:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.3
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728911526;
	cv=none; b=cU5z9c1JJOd35/G2pk5nj7j8YJTNSQpNlmyBm+ICOmbjQ7m20gs2A9dXBFMOixOZLLFt1t+E4iQqXvUeAkA7MEWkWE2gVwMGJr05mtXGB3ofiCkbUUzJPziZSmXgWFiaBQsbkNd5L5cS2la1zDCXFUkSOLFYYzyafi88xdfhXDriee3wRkSuYcjNTXhEuYlRQfWiKCiw1/OGppXIZor4HmORZHLFC/XheBRsebKnXAGOtMx0vs9GF8i7Q/XV9EF49dEgZlbDu7G3Wty4Ic30pYztzsqUVxCUVOedJBs8CobPJqXSyGBmECGJrguyAFD7KYptO/FK1z95lpOgRmWcDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728911526; c=relaxed/relaxed;
	bh=TfCLl53lB42+HRnDMfXfFuOecGZa7W9eJj72/YGIQ90=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=YUg38e6zwNuYYW5xXOovLz0V7zCn3OdDeioP6gO7OPtwzCLRnQPQN3teYS8Cbzglu6LaRrcaYUzEn7nx0/M2cBmK3WGhN2i9aDzXNQyo4xChqzPIjWYOfT37fPm3EBtmGWaNUBoInSNQg8xSszynQNGRlh5U+gpNKqsc8io8Ds16pvOrJijKX58GtUoWMOHOhHVGQR9/qkd5PsBYjH4BiwItcqiN2dPgEhvR3RIv6EudwqRuU5HX1veDlni6QPEMRR+v3Brt/iz+nB5qM/7bY3L+41csPp1+0vfsKMsQbRv/i7rzayPqOhSfCgiOO7++97fC6Eaj8cIIGMR8NvI2UA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=RsqfMZQ9; dkim-atps=neutral; spf=pass (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=RsqfMZQ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRyLW16Pgz3br7
	for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Oct 2024 00:12:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728911450; x=1729516250; i=markus.elfring@web.de;
	bh=TfCLl53lB42+HRnDMfXfFuOecGZa7W9eJj72/YGIQ90=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RsqfMZQ9Q+piDeHZsRcFUz3vDcgukjqoWXoDiTWFgKUxTOc9IPe2aCGni6qXn7sp
	 cWrWorf72z2G6j8w2Tb4TUOIB4mjb13kkPjpGGcQreoyMbHBe0gldDx8qm+J2d2fX
	 if4LMXB2Q1UeFTSnlBQ8hxMq9sc03DBN9jFRiYvYa8/2bA9rSkL3qzPeGGgr941bq
	 eAxgsqZGQDpmYGKSLCCCVEGJfxVfA3vTLVUbGWTGpamLNUau6zGj3hBIXji0aq4TR
	 ebvHDjkaUsvf1+JsHWeAmltdZcS4bcVAiv8KnleMRXbGfrdgJYQd979y7eS7t91RX
	 soazwx1zCzQFXrVzjQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [94.31.82.95] ([94.31.82.95]) by web-mail.web.de
 (3c-app-webde-bs22.server.lan [172.19.170.22]) (via HTTP); Mon, 14 Oct 2024
 15:10:50 +0200
MIME-Version: 1.0
Message-ID: <trinity-a5696b99-bf11-4ae3-8b00-20db116f86e4-1728911450361@3c-app-webde-bs22>
From: Markus Elfring <Markus.Elfring@web.de>
To: Kevin Chen <kevin_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: RE: [PATCH v3 2/2] irqchip/aspeed-intc: Add support for AST27XX
 INTC
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Oct 2024 15:10:50 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <PSAPR06MB49491F8E0CE4069E9B9B1EA289442@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20241009115813.2908803-3-kevin_chen@aspeedtech.com>
 <f65dd139-1021-47d6-93a1-1477d6b4ca1d@web.de>
 <PSAPR06MB4949904D1FA95DBD3EF5288A89792@PSAPR06MB4949.apcprd06.prod.outlook.com>
 <0b995a34-28c4-4ba6-8ad2-e8413c6a63f5@web.de>
 <PSAPR06MB49491F8E0CE4069E9B9B1EA289442@PSAPR06MB4949.apcprd06.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:ovMgIH1q08E5i7Y9d9W6SUygzJNgl2aH+f4oZ4d1KfDWxtS1ZMfItM3wjo2ZYndBhaV9q
 sVsLTIFgAYVRuSGipm1FsubPyMzqvHvSteb4G59YcNgWaH80fuZ+UuXRhPLk821rLkBWIHkW30Ba
 VuUDtM44h0UWnxTNZYXbFpGTgDzjWiAqxxZewwynGk07TGaZ4vBcMMMseNsjk6+009ifsSk1T9Ls
 iLk4yLDwTV9z52eLXfrkRI8yHmF15qSC360cl5/tXmjX9eSQZSPkWuhDfWfFwGqJltTJCXY+R1n6
 Lg=
UI-OutboundReport: notjunk:1;M01:P0:8QIWZabSQls=;BMNnAN1dJoT/6h4uy684oy1oyg8
 jrr4wBj+qthZ8l5y3dGE0as9BdePavt6FDWiZKGS3Yr049y/u0M/KiuShJ0T2cDVVKUbEU+zi
 Xl5t6BmSc61xxFU9MdSfNICci4xBwBccugddklaAsddcr2R3CaPDxnBIpwjEWt5IfsippsbXo
 XMQaT2aeUTUeH2NJ5ahSYKQX1XzAFtPT0DyrpMFZAjD8NFCi+sCScDnS0oML6SJTWh16r3N2a
 lQCcJ4e64lhGQl6xQqMsgOjXMwKNzw9+LfRRKWICv5jIIjTGFFqGhqd9rDxGnzAkM9h92Z3QY
 h4VyosDzY+iyf62bvzV266k7Bkor4XhdmG4dZcQ8gACuyDklooc/yxqrASQHtxvNzRhkwu13G
 ysI0HF4gNIOlqkpZNj5S1PwDPHh4MvNPnASCcbC2PhdZ0uuN1W/pdlCyzVZYGTkGLHroGyX4X
 uZ4z5OOD+0sJBjzda777h/6WDufB+Bn9wLlSt9mdaEFpZEgh/mo6L3G42b3hGW6V/t+7i9PiK
 XKPA6/hyqPvPB6nzz4/zsXGBfl/Vf1AGY73RIL9/qBTKRL14OCkz3CZ2tQg+llzPA29N+jzBt
 0wFLFE2HXPBjU7gi4SxYZuvg/HhrprBjX1rKExITz/nYgz2FUw9Q+1KrsbdzWNdudmOy/Nsy9
 fcK81NPE/cadP3hS6Ihiu0Md3pwMkaexbVlfkxeHmA==
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> > I propose to move selected variable definitions into corresponding comp=
ound
> > statements (by using extra curly brackets)=2E
> > https://refactoring=2Ecom/catalog/reduceScopeOfVariable=2Ehtml
> OK=2E I moved these two local variables into scoped_guard=2E

Will development interests grow for further refactorings?


> +static void aspeed_intc_ic_irq_handler(struct irq_desc *desc)
> +{
> +       struct aspeed_intc_ic *intc_ic =3D irq_desc_get_handler_data(des=
c);

Another update candidate (for scope reduction)?


> +
> +       guard(chained_irq)(desc);

Using another macro call =E2=80=9Cscoped_guard(=E2=80=A6) { =E2=80=A6 }=E2=
=80=9D?


> +       scoped_guard(raw_spinlock, &intc_ic->gic_lock) {

Would you like to reconsider the proposed macro mixture once more?


> +               unsigned long bit, status;
=E2=80=A6

=E2=80=A6
> +++ b/include/linux/irqchip/chained_irq=2Eh
> @@ -38,4 +38,6 @@ static inline void chained_irq_exit(struct irq_chip *c=
hip,
>                 chip->irq_unmask(&desc->irq_data);
>  }
>=20
> +DEFINE_GUARD(chained_irq, struct irq_desc *, chained_irq_exit((_T->irq_=
data=2Echip), (_T)),
> +            chained_irq_enter((_T->irq_data=2Echip), (_T)))

Would you like to add a #include directive in this header file accordingly=
?

Regards,
Markus
