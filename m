Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F96889528E
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Apr 2024 14:09:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=kKT+zZZF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V86Bf37Ypz3dVp
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Apr 2024 23:09:46 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=kKT+zZZF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V86BZ1KmYz2xPd
	for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Apr 2024 23:09:42 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5ED4C200E0;
	Tue,  2 Apr 2024 20:09:40 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712059781;
	bh=emjzUDDqOpO14ZhysyWQJh3ovWJjdiQOg95LkukSphw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kKT+zZZFOaNhupP6tEx0DyFImtF+6Wo0ztnhUlc5gxPF4+Pfk/3j0oCL/A10KJUPK
	 RV+VoLqisLrabWfWiYigDtSLNIkECYXhHgcsvJvlfhIBEo7EgWC0Bg/eZXwIVck4Ai
	 bgLdLs0Ip2od48f6AtTZM/k8u0HBqv6kbdVm4z1ufRukbJfIhnRJlNiakJOORYsso7
	 9DAS1bv8lNQOezoNo5BtqnX3T9fdt90SXU75gYayzkH/IzPmysCTmc7lTODLwfwNCH
	 M0dCwPoJm1MkLDKbYFxoQuqq7KYqvfXGVYsNStcrzFU1Hz2Twn3HfF5EXeOpO5Aqrv
	 lJZf7Wvm6yrjw==
Message-ID: <ab76b0549172cf3e33d6242fa9ea3e6a87b4a58e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 3/4] dt-bindings: watchdog: aspeed-wdt: Add aspeed,scu
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Peter Yin <peteryin.openbmc@gmail.com>
Date: Tue, 02 Apr 2024 22:39:32 +1030
In-Reply-To: <20240401135637.GA342928-robh@kernel.org>
References: <20240328022231.3649741-1-peteryin.openbmc@gmail.com>
	 <20240328022231.3649741-4-peteryin.openbmc@gmail.com>
	 <20240401135637.GA342928-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2024-04-01 at 08:56 -0500, Rob Herring wrote:
> On Thu, Mar 28, 2024 at 10:22:30AM +0800, Peter Yin wrote:
> > To use the SCU register to obtain reset flags for supporting
> > bootstatus.
> >=20
> > Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt =
b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > index 3208adb3e52e..80a1f58b5a2e 100644
> > --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > @@ -8,6 +8,8 @@ Required properties:
> > =20
> >   - reg: physical base address of the controller and length of memory m=
apped
> >     region
> > + - aspeed,scu: a reference to the System Control Unit node of the Aspe=
ed
> > +   SOC.
>=20
> You cannot add new required properties as that is an ABI break.
>=20
> If there's only 1 SCU instance, you can just fetch its node by=20
> compatible with no DT change.
>=20
> What's the plan for converting this binding to schema? This is the 2nd=
=20
> new property in 6 months.

I had a patch converting it in a local branch which I've now sent:

https://lore.kernel.org/all/20240402120118.282035-1-andrew@codeconstruct.co=
m.au/

Perhaps we can pull it into this series?

Andrew
